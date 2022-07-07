@isTest
public class TestphAccUpd 
{
    @isTest
    static void updtePhone()
    {
 		Map<Id, Account> oldmap = New Map<Id, Account>();
        Map<Id, Account> newmap = New Map<Id, Account>();
        Account a = New Account (Name = 'A', Phone = '9888207322');
        insert a;
        oldmap.put(a.Id, a);
        
       // Contact c = New Contact();
       // c.AccountId = a.Id;
        
        //Perform Test
        Test.startTest();
        a.Phone = '1234567890';
        update a;
        newmap.put(a.id, a);
        Test.stopTest();

        
    }

}