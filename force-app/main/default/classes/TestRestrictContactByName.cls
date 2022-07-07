@isTest
private class TestRestrictContactByName 
{
    @isTest static void BlockAddContact()
    {
        Contact C = New Contact (LastName = 'INVALIDNAME');
        insert C;
    }

}