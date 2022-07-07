@isTest
public class TestoppCityAcc 
{
    @isTest
    static void updateOpp()
    {
        Account a = New Account (Name = 'A', City__c = 'Chd');
        insert a;
        List<Opportunity> opp = new List<Opportunity>();
        opportunity opp2 = new opportunity(Name = 'A', StageName = 'Need Analysis', CloseDate = Date.parse('06/12/22'), city__c = 'Chd', AccountId = a.Id);
    
    /*  opp2.Name = 'A';
        opp2.StageName = 'Need Analysis';
        opp2.CloseDate = Date.parse('06/12/22');
        opp2.city__c = 'Chd';
        opp2.AccountId = a.Id; 
	*/
        opp.add(opp2);	
        insert opp;
        
        Test.startTest();
        a.City__c = 'HR';
        update a;
       
        
        Test.stopTest();
    }

}