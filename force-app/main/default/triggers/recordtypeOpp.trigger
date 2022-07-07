trigger recordtypeOpp on Opportunity (after insert, after update) 
{
    List<Opportunity>oppList = new List<Opportunity>();
    Set<Id> setOppId = new Set<Id>();

    for(Opportunity Opp : trigger.new)
    {
       if(Opp.StageName == 'Closed Won' && Opp.RecordTypeId == '0125j0000009tfSAAQ' && Opp.Create_Renewal__c == True)
       {
           Opportunity Opp2 = new Opportunity();
            Opp2.Name = Opp.Name + ' Renewal';
            Opp2.StageName = 'Prospecting';
            Opp2.RecordTypeId = '0125j0000009tfrAAA';
            Opp2.CloseDate = Opp.CloseDate+365;
            Opp2.Parent_Opportunity__c = Opp.Id;
            oppList.add(Opp2);
         
            setOppId.add(Opp.Id);
       }
//      for(Opportunity OppL : [Select Id, Name, (Select Id, Name, Product2Id, ProductCode, Quantity, ListPrice, UnitPrice, TotalPrice  From OpportunityLineItems) From Opportunity Where Id in : setOppId])
       
        
    }
insert oppList;
    
    
}