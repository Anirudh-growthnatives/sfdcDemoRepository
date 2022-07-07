@isTest
public class Test_contactCnt {
    @isTest
    static void count_contact()
    {
  		
        Account acc = new Account();
        acc.Name='test';
        insert acc;
        
        Contact c = new Contact();
        c.AccountId =acc.Id;
        c.LastName='ss';
        insert c;
        
        c.FirstName = 'a';
        update c;
    }

}