public class Task1TriggerHandler {
    public static void isChanged(List<Account> newList){
        for(Account acc : newList)
        {
            if(acc.Type=='Prospect')
            {
                acc.isChanged__c=true;
            }
        }
    }
    public static void updateIsChanged(List<Account> newList,Map<Id,Account> oldList){
        for(Account acc : newList)
        {
            if(acc.Type!=oldList.get(acc.Id).Type && acc.Type=='Prospect')
            {
                acc.isChanged__c=true;
            }
        }
    }
}