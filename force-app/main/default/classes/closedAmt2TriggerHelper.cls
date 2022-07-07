public class closedAmt2TriggerHelper 
{
    public static void amountFieldAccount(List<Opportunity> NewList, List<Opportunity> oldList)
    {
        
        Set<Id> accIdSet = new Set<Id>();
        if(!trigger.isDelete)
        {
        	for(Opportunity opp : NewList)
        	{
            	if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
            	{
                	accIdSet.add(opp.AccountId);
            	}  
        	}
        }
        if(trigger.isDelete)
        { 
            for(Opportunity opp : oldList)
            {
                if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
                {
                    accIdSet.add(opp.AccountId);
                }
            }
        }
        
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        accList = [Select id, Closed_Amount__c from Account where Id in : accIdSet];
        oppList = [Select id, Name, Amount from Opportunity where AccountId in : accIdSet];
        List<Account> accList2 = new List<Account>();
        for(Account acc : accList )
        {
            integer val = 0;
            for(Opportunity opp : oppList)
            {
                val += integer.valueOf(opp.Amount);   
            }
            acc.Closed_Amount__c = integer.valueOf(val);
            acclist2.add(acc);
        }
        if(acclist2.size()>0)
        {
            update accList2;
        }
        
    }
    
}