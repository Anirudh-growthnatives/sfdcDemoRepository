trigger updLeadCont on CampaignMember (after insert, after update) 
{
    if(trigger.isAfter)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
            Set<Id> camids = new Set<Id>();
            Set<Id> ledids = new Set<Id>();
            Set<Id> conids = new Set<Id>();
            for(CampaignMember cm : trigger.new)
            {
                if(cm.LeadId != Null)
                {
                    camids.add(cm.CampaignId);
                    ledids.add(cm.LeadId);
                }
                else if(cm.ContactId != Null)
                {
                    camids.add(cm.CampaignId);
                    conids.add(cm.ContactId);
                }
            }
    
                Map<Id, Campaign> campmap = new Map<Id, Campaign>([Select Id,Name From Campaign Where Id In : camids]);
                Map<Id, Lead> ledmap = new Map<Id, Lead>([Select Id, Company__c From Lead Where Id In : ledids]);
                Map<Id, Contact> conmap = new Map<Id, Contact>([Select Id, Company__c From Contact Where Id In : conids]);
    
                for(CampaignMember cm : trigger.new)
                {
                    if(cm.LeadId != Null)
                    {
                        for(lead l : ledmap.values())
                        {
                            if(campmap.get(cm.CampaignId).name.contains('Microsoft'))
                            {
                                l.Company__c = 'Microsoft';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Amazon'))
                            {
                                l.Company__c = 'Amazon';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('TCS'))
                            {
                                l.Company__c = 'TCS';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Delliote'))
                            {
                                l.Company__c = 'Delliote';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Growth Natives'))
                            {
                            l.Company__c = 'Growth Natives';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Nagarro'))
                            {
                            l.Company__c = 'Nagarro';
                            }
                        }
                    }
        
                    if(cm.ContactId != Null)
                    {
                        for(contact con: conmap.values())
                        {
                            if(campmap.get(cm.CampaignId).name.contains('Microsoft'))
                            {
                                con.Company__c = 'Microsoft';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Amazon'))
                            {
                                con.Company__c = 'Amazon';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('TCS'))
                            {
                                con.Company__c = 'TCS';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Delliote'))
                            {
                                con.Company__c = 'Delliote';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Growth Natives'))
                            {
                                con.Company__c = 'Growth Natives';
                            }
                            else if(campmap.get(cm.CampaignId).name.contains('Nagarro'))
                            {
                                con.Company__c = 'Nagarro';
                            }
                        }
                    }
                }

            if(ledmap.values().size() > 0) 
            {
                update ledmap.values();
            }
            if(conmap.values().size() > 0) 
            {
                update conmap.values();        
            }
            
        }
    }
}