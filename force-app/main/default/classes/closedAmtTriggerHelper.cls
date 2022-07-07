public class closedAmtTriggerHelper 
{
    public static void amountFieldAccount(List<Opportunity> NewList, Map<Id,Opportunity> newmap)
    {
        Set<Id> accIdSet = new Set<Id>();
        for(Opportunity opp : NewList)
        {
            if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
            {
                accIdSet.add(opp.AccountId);
            }  
        }
     /* if(!oldlist.isEmpty())
        {
            system.debug('as1' + oldlist);
        	for(Opportunity opp : oldlist)
        	{
                system.debug('as2' + oldlist);
            	if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
            	{
                	accIdSet.add(opp.AccountId);
            	}
            }
        }
*/
        
        Map<Id, List<Opportunity>> map1 = new Map<Id, List<Opportunity>>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        if(accIdSet.size() > 0)
        {
            oppList = [SELECT Amount, AccountId FROM Opportunity WHERE AccountId IN : accIdSet];
            for(Opportunity opp : oppList)
            {
                if(!map1.containsKey(opp.AccountId))
                {
                    map1.put(opp.AccountId, new List<Opportunity>());
                } 
                else
                {
                    map1.get(opp.AccountId).add(opp);
                }
                
            }	
            
            List<Account> accList = new List<Account>();
            List<Account> accList2 = new List<Account>();
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
                accList2.add(acc);
            }
            update accList2;
        }
    } 
    public static void amountFieldAccount2(List<Opportunity> oldlist)
    {
        Set<Id> accIdSet = new Set<Id>();
        if(trigger.isDelete)
        {
        	for(Opportunity opp : OldList)
        	{
            	if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
            	{
                	accIdSet.add(opp.AccountId);
            	}
            }
        }
        Map<Id, List<Opportunity>> map1 = new Map<Id, List<Opportunity>>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        if(accIdSet.size() > 0)
        {
            oppList = [SELECT Amount, AccountId FROM Opportunity WHERE AccountId IN : accIdSet];
            for(Opportunity opp : oppList)
            {
                if(!map1.containsKey(opp.AccountId))
                {
                    map1.put(opp.AccountId, new List<Opportunity>());
                } 
                else
                {
                    map1.get(opp.AccountId).add(opp);
                }
                
            }	
            
            List<Account> accList = new List<Account>();
            List<Account> accList2 = new List<Account>();
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
                accList2.add(acc);
            }
            update accList2;
        }
    } 
        
}