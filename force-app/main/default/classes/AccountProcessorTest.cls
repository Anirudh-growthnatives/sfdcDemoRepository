@isTest
private class AccountProcessorTest 
{
    @isTest
    private static void testMethod1()
    {
    
        Account acc = new Account();
        acc.Name='test';
        insert acc;
        List<Id> accountids = new List<Id>();
        Contact c = new Contact();
        c.AccountId =acc.Id;
        c.LastName='ss';
        insert c;
        
        accountids.add(acc.Id);
        test.startTest();
        AccountProcessor.countContacts(accountids);
        test.stopTest();
     
        
    }
    

}