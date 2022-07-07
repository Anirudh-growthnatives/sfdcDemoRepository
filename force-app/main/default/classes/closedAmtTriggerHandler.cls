public class closedAmtTriggerHandler 
{
    public static void onAfterInsert(List<Opportunity> newlist, Map<Id, Opportunity> newmap)
    {
        closedAmtTriggerHelper.amountFieldAccount(newlist, newmap);
    }
    public static void onAfterUpdate(List<Opportunity> newlist, Map<Id, Opportunity> newmap)
    {
        closedAmtTriggerHelper.amountFieldAccount(newlist, newmap);
        
    } 
     public static void onAfterDelete(List<Opportunity> oldlist)
    {
        system.debug('asdf' + oldlist);
        closedAmtTriggerHelper.amountFieldAccount2(oldlist);     
    } 
    
}