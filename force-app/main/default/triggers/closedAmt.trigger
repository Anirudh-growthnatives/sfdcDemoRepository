//"Create a field on Account- Closed amount (Number type) 
//Update the Total amount of close won opportunities on Account"
trigger closedAmt on Opportunity (after insert, after update, after delete)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            closedAmtTriggerHandler.onAfterInsert(Trigger.New, Trigger.NewMap);
        }
        if(Trigger.isUpdate)
        {
            closedAmtTriggerHandler.onAfterUpdate(Trigger.New, Trigger.NewMap);
        }
        if(Trigger.isDelete)
        {
            system.debug('asdf' + trigger.old);
            closedAmtTriggerHandler.onAfterDelete(Trigger.Old);
        }
    }  
}







/*
trigger closedAmt on Opportunity (after insert, after update, after delete){
    
    Map<Id, List<Opportunity>> map1 = new Map<Id, List<Opportunity>>();
    List<Opportunity> oppList = new List<Opportunity>();
    Set<Id> accIdSet = new Set<Id>();
    
    if(trigger.isUpdate || trigger.isInsert)
    {
        if(trigger.isAfter)
        {
            for(Opportunity opp : trigger.new)
            {
                if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
                {
                    accIdSet.add(opp.AccountId);
                }  
            }
        }
    }
    
    if(trigger.isDelete)
    {
        if(trigger.isAfter)
        {
            for(Opportunity opp : trigger.old)
            {
                if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
                {
                    accIdSet.add(opp.AccountId);
                }  
            }
        }
    }
    
    if(accIdSet.size() > 0)
    {
        oppList = [SELECT Amount, AccountId FROM Opportunity WHERE AccountId IN : accIdSet];
        for(Opportunity opp : oppList)
        {
            if(!map1.containsKey(opp.AccountId))
            {
                map1.put(opp.AccountId, new List<Opportunity>());
            } else{
                map1.get(opp.AccountId).add(opp);
            }
            
        }	
        
        List<Account> accList = new List<Account>();
        accList = [SELECT Closed_Amount__c FROM Account WHERE Id IN : accIdSet];
        for(Account acc : accList)
        {
            Double oppAmt = 0;
            for(Opportunity opp : map1.get(acc.Id))
            {
                if(opp.Amount != null)
                {
                    oppAmt += opp.Amount;
                }
            }
            acc.Closed_Amount__c = oppAmt;
        }
        update accList;
    }
}	*/