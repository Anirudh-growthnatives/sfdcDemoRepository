/*
    "Create two fields on Campaign- 1. Capping (checkbox) 2.Capping Value (number)
    1. When cappping is set to true,make the capping value required to fill.
    2. The capping value can not contain negative and 0 integer. Add error for that.
    3. Capping value cannot be less than registered campaign memeber.Add error for that.
    4. When capping value is filled and status of campaignmember is Engaged, set the status to Registered of the campaignmambers matching the capping value field and set the status of remaining campaign members to Waitlisted."
*/

trigger campaignTask on Campaign ( before insert, before update, after update) 
{ 
    List<CampaignMember> CampaignMemberListToUpdate = new List<CampaignMember>();    
    Set<id> CampaignIdset = new Set<id>();
    if((Trigger.isInsert || trigger.isUpdate) && trigger.isBefore)
    {
        for(Campaign cm : trigger.new)
        {
            CampaignIdset.add(cm.id);
            if(cm.Capping__c == true && cm.Capping_Value__c == null )
            {
                cm.Capping_Value__c.addError('Capping Value Cannot Be Empty');
            }
        }        
        List<CampaignMember> cmpMemList = [Select id From CampaignMember Where Status = 'Registered' AND CampaignId in:CampaignIdset];
        integer sum = cmpMemList.size();
        for(Campaign cm : trigger.new)
        {
            if(cm.Capping_Value__c < sum)
            {
                cm.Capping_Value__c.addError('Capping Value Should be greater than Registered Campaign Members');
                
            }
        }
        for(Campaign cm : trigger.new)
        {
            if(cm.Capping_Value__c <= 0)
            {
                cm.Capping_Value__c.addError('Capping value should be greater than zero');
            }
        } 
    }
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
        {
            Set<Id> CampaignTriggeredId = new Set<Id>();
            for(Campaign CampaignNewObj : Trigger.new)
            {
                Campaign  CampaignOldObj = Trigger.oldMap.get(CampaignNewObj.Id);
                //  if(CampaignNewObj.Capping_Value__c != CampaignOldObj.Capping_Value__c && CampaignNewObj.Capping__c)
                CampaignTriggeredId.add(CampaignNewObj.Id);
            } 
            Map<Id, Integer> Map1 = new Map<Id, Integer>();
            for(Campaign CamData : [select id, Name,(select id from CampaignMembers where Status='Registered') from Campaign where Id In :CampaignTriggeredId])
            {
                Map1.put(CamData.Id, CamData.CampaignMembers.size());
            }
            for(Campaign cam : [select id,Capping_Value__c,(select id,status from CampaignMembers order by createddate) from Campaign where ID IN: CampaignTriggeredId])
            {
                Integer size = Map1.containsKey(cam.Id) ? Map1.get(cam.id) : 0;
                for(CampaignMember cmb : cam.CampaignMembers)
                {
                    if(size<cam.Capping_Value__c && (cmb.Status == 'Waiting List' || cmb.Status == 'Engaged'))
                    {
                        size++;
                        cmb.Status = 'Registered';
                    }
                    else if(size == cam.Capping_Value__c)
                    {
                        if(cmb.Status != 'Registered')
                        {
                            cmb.Status = 'Waiting List';
                        }
                    }
                    CampaignMemberListToUpdate.add(cmb);  
                }
                System.debug('size = '+size);
            }
            if(CampaignMemberListToUpdate.size()>0)
            {    
                Update CampaignMemberListToUpdate;  
            }
            
        }   // End of isUpdate   
    }
}