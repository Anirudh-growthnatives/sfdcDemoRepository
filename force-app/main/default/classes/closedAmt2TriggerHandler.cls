public class closedAmt2TriggerHandler 
{
    public static void onAfterInsert(List<Opportunity> newlist)
    {
        closedAmt2TriggerHelper.amountFieldAccount(newlist, null);
    }
    public static void onAfterUpdate(List<Opportunity> newlist)
    {
        closedAmt2TriggerHelper.amountFieldAccount(newlist, null);
    } 
    public static void onAfterDelete(List<Opportunity> oldList)
    {
        closedAmt2TriggerHelper.amountFieldAccount(null,oldList);     
    } 
    
}