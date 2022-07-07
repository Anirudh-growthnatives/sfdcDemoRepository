public class Task2Handler
{
    public static void updateAmount(List<Opportunity> newList){
        Map<Id,Id> mapped=new Map<Id,Id>();
        list<Account> account= new list<Account>();
        for(Opportunity opp : newList)
        {
            //if(opp.StageName=='Closed Won')
                mapped.put(opp.id,opp.AccountId);
        }
       for(Account acc :[select Closed_Amount__c,(select Amount, StageName from Opportunities) from Account where Id IN :mapped.values()])
        {
            decimal rar=0;
            for(Opportunity opp:acc.Opportunities)
            {
              if(opp.StageName == 'Closed Won')
               rar+=opp.Amount;
            }
            acc.Closed_Amount__c=rar;
            account.add(acc);
        }
        update account;
    }
}