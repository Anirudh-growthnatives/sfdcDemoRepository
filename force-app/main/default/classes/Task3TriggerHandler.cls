public class Task3TriggerHandler 
{
    public static void updateLicence(list<Opportunity> newlist)
    {
       list<Opportunity> listofopp = new list <Opportunity>();
       list<OpportunityLineItem> listofoli = new list <OpportunityLineItem>();
        
        for(Opportunity opp : newList)
        {
            if(opp.StageName == 'Closed Won')
            {
            	listofopp.add(opp);
            }
        }
        for(Opportunity opp : listofopp)
        {
            for(OpportunityLineItem oli : [SELECT Licence_Id__c, Product2Id FROM OpportunityLineItem WHERE OpportunityId =: opp.Id])
            {
                String s,s1;
                for(Product2 pro : [SELECT Name FROM Product2 WHERE Id =: oli.Product2Id])
                {
                    s = pro.Name;
                    s = s.substring(0,3);
          
                }
                oli.Licence_Id__c = s;
                listofoli.add(oli);
            }
            if(listofoli != null)
                update listofoli;
        }
    }
  }