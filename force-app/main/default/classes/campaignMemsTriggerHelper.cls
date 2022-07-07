public class campaignMemsTriggerHelper {
    public static void campaignErrors(List<Campaign> newList)
    {
        List<CampaignMember> CampaignMemberListToUpdate = new List<CampaignMember>();    
        Set<id> CampaignIdset = new Set<id>();
        
        for(Campaign cm : newList)
        {
            CampaignIdset.add(cm.id);
            if(cm.Capping__c == true && cm.Capping_Value__c == null )
            {
                cm.Capping_Value__c.addError('Capping Value Cannot Be Empty');
            }
        }        
        List<CampaignMember> cmpMemList = [Select id From CampaignMember Where Status = 'Registered' AND CampaignId in:CampaignIdset];
        integer sum = cmpMemList.size();
        for(Campaign cm : newList)
        {
            if(cm.Capping_Value__c < sum)
            {
                cm.Capping_Value__c.addError('Capping Value Should be greater than Registered Campaign Members');
                
            }
        }
        for(Campaign cm : newList)
        {
            if(cm.Capping_Value__c <= 0)
            {
                cm.Capping_Value__c.addError('Capping value should be greater than zero');
            }
        } 
    }
    public static void campaignErrors2(List<Campaign> newList, Map<Id,Campaign> oldMap )
    {
        List<CampaignMember> CampaignMemberListToUpdate = new List<CampaignMember>();   
        Set<Id> CampaignTriggeredId = new Set<Id>();
            for(Campaign CampaignNewObj : newList)
			{
                Campaign  CampaignOldObj = oldMap.get(CampaignNewObj.Id);
                //	if(CampaignNewObj.Capping_Value__c != CampaignOldObj.Capping_Value__c && CampaignNewObj.Capping__c)
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
    }
    
}