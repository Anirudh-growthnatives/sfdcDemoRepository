public class copyOppTextFieldTriggerhandler 
{
    public static void onAfterUpdate(List<Opportunity> newlist)
    {
        copyOppTextFieldTriggerHelper.textFieldOpportunity(newlist);
        
    } 
}