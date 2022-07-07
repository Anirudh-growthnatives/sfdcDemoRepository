@isTest
public class closedAmt_Test
{
    @isTest
    static void closedAmt_Test_1()
    {
        Account testAcc1 = new Account (Name = 'Test Account 1');
        insert testAcc1;
        Opportunity testOpp1 = new Opportunity (Name = 'A', CloseDate = date.newInstance(2022, 12, 15), AccountId = testAcc1.Id, StageName = 'Closed Won', Amount = 101);
        insert testOpp1;
        testOpp1.Amount = 102;
        update testOpp1;
    }

}