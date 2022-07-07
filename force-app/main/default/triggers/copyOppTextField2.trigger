trigger copyOppTextField2 on Opportunity (after update) 
{
    map<ID,String> m1 = new map<ID,String>();
    for(Opportunity opp : Trigger.new)
    {
        m1.put(opp.ID,opp.Text_Field__c);
    }
    List<OpportunityLineItem> oppLineList1 = new List<OpportunityLineItem>();
    List<OpportunitylineItem> oppLineList2 = new List<OpportunitylineItem>();
    oppLineList2 = [SELECT Id,OpportunityID from OpportunitylineItem where OpportunityID IN : m1.KeySet()];
    for(OpportunitylineItem oppli : oppLineList2)
    {
        oppli.Text_Field__c = m1.get(oppli.OpportunityID);
        oppLineList1.add(oppli);
    }
    if(!oppLineList1.isEmpty())
    {	
        update oppLineList1;
    }
}