trigger campaignComp on Campaign (after insert, after update) 
{
    if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            List<Lead> leadList = new List<Lead>();
            Map<Id, String> map1 = new Map<Id, String>();
            set<String> set1 = new set<String>();
            set1.add('Microsoft');
            set1.add('Amazon');
            set1.add('TCS');
            set1.add('Delliote');
            set1.add('Growth Natives');
            set1.add('Nagarro');
            system.debug('set1 values >>' + set1);
            
            for(Campaign camp : trigger.new)
            {
                map1.put(camp.Id, camp.Name);
            }
            
            for(Lead l : [Select Id, Name, (Select Id, Name From CampaignMembers) From Lead Where Id in : map1.values()])
            {
                String str = l.Name;
                if(set1.contains(l.Name))
                {
                   
                    l.Company__c = l.Name;
                    leadList.add(l);
            	}
        }
          update leadList;  
    }
}
}