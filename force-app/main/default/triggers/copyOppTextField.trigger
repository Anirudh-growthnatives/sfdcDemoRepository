// Copy the values of a text field in Opportunity to is related opportunity line items
trigger copyOppTextField on Opportunity (after update)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
        {
            copyOppTextFieldTriggerhandler.onAfterUpdate(Trigger.New);
        }
    }  
}

/*
trigger copyOppTextField on Opportunity (after update) 
{
    Set<Id> oppIdSet = new Set<Id>();
    if(trigger.isUpdate)
    {
        if(trigger.isAfter)
        {
            for(Opportunity opp : trigger.new)
            {
                if(opp.Text_Field__c != null)
                {
                    oppIdSet.add(opp.Id);
                }      
            }
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
}   */