public class copyOppTextFieldTriggerHelper 
{
    public static void textFieldOpportunity(List<Opportunity> NewList)
    {
        Set<Id> oppIdSet = new Set<Id>();
        for(Opportunity opp : NewList)
        {
            if(opp.Text_Field__c != null)
            {
                oppIdSet.add(opp.Id);
            }
        }
        
        List<OpportunityLineItem> oppLIList = new List<OpportunityLineItem>();
        List<Opportunity> oppList = new List<Opportunity>();
        oppLIList = [SELECT ID, Text_Field__c FROM OpportunityLineItem WHERE opportunityId IN : oppIdSet];
        oppList = [SELECT ID, Text_Field__c FROM Opportunity WHERE Id IN : oppIdSet];
        
        for(OpportunityLineItem oppLI : oppLIList)
        {
            for(Opportunity opp : oppList)
            {
                string str = opp.Text_Field__c;
                oppLI.Text_Field__c = str;
            }
            update oppLI;
        }
    }
}