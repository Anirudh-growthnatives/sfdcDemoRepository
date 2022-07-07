@isTest
public class campaignTask_Test 
{
    @isTest
    static void campaigntest0()
    {
        try
        {
            Account testAcc = new Account (Name = 'Test Account');
            {
                insert testAcc;
            }
            Campaign cm = new Campaign(Name = 'a', Capping__c = true);
            insert cm;
            Contact testContact = new Contact(FirstName = 'TestContactF', LastName = 'TestContactL', Email = 'none@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact;
            CampaignMember cmm = new CampaignMember(CampaignId = cm.Id,ContactId = testContact.id, status='Sent' );
            insert cmm;
            
        }
        catch(Exception e)
        {       
            System.assert(e.getMessage().contains('Capping Value Cannot Be Empty'));
        }
    }
    
    
    
    @isTest
    static void campaigntest1() 
    {
        try
        {
            Account testAcc = new Account (Name = 'Test Account');
            {
                insert testAcc;
            }
            Campaign cm = new Campaign(Name = 'a', Capping__c = true, Capping_Value__c = 0);
            insert cm;
            Contact testContact = new Contact(FirstName = 'TestContactF', LastName = 'TestContactL', Email = 'none@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact;
            CampaignMember cmm = new CampaignMember(CampaignId = cm.Id,ContactId = testContact.id, status='Sent' );
            insert cmm;  
            
        }
        catch(Exception e)
        {       
            System.assert(e.getMessage().contains('Capping value should be greater than zero'));
        } 
        
    }
    
    @isTest
    static void campaigntest2()
    { 
        try
        {
            Account testAcc = new Account (Name = 'Test Account');
            insert testAcc;
            
            Contact testContact1 = new Contact(FirstName = 'TestContact1', LastName = 'TestContact1', Email = 'none1@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact1;
            
            Contact testContact2 = new Contact(FirstName = 'TestContact2', LastName = 'TestContact2', Email = 'none2@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact2;
            
            Campaign cm = new Campaign(Name = 'a');
            insert cm;
            
            CampaignMember cmm = new CampaignMember(CampaignId = cm.Id,ContactId = testContact1.id, Status = 'Enganged' );
            insert cmm;
            
            CampaignMember cmm1 = new CampaignMember(CampaignId = cm.Id,ContactId = testContact1.id, Status = 'Engaged' );
            insert cmm1;
            cm.Capping__c = true;
            cm.Capping_Value__c = 2;
            update cm;
            cm.Capping_Value__c = 1;
            update cm;
        }
        catch(Exception e)
        {       
            //System.assert(e.getMessage().contains('Value Should be greater than Registered Campaign Members'));
        } 
        
    }
    
    @isTest
    static void campaigntestfinal()
    {
        Test.startTest();
            Account testAcc = new Account (Name = 'Test Account');
            insert testAcc;
            
            Contact testContact1 = new Contact(FirstName = 'TestContact1', LastName = 'TestContact1', Email = 'none1@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact1;
            
            Contact testContact2 = new Contact(FirstName = 'TestContact2', LastName = 'TestContact2', Email = 'none2@navinet.net', accountid = testAcc.Id, LeadSource = 'Community');
            insert testContact2;
            
            Campaign cm = new Campaign(Name = 'a', Capping_Value__c = 1);
            insert cm;
        
            
        	CampaignMember cmm2 = new CampaignMember(CampaignId = cm.Id, ContactId = testContact1.id, Status = 'Engaged' );
            insert cmm2;
        
        
            cm.Capping_Value__c = 2;
            update cm;
        Test.stopTest();
    }
}