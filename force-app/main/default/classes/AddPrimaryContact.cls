public class AddPrimaryContact implements Queueable
{    
    private Contact contact;
    private String state;
	
        public AddPrimaryContact (Contact inputContact, String inputState)
	{
		this.contact = inputContact;
        this.state = inputState;
	}
    
    public void execute(QueueableContext context)
    {
		// Retrieve 200 Account records
		List<Account> accounts = [SELECT Id FROM Account WHERE BillingState =:state LIMIT 200];
        
        // Create empty list of Contact records
        List<Contact> contacts = new List<Contact>();
        
        // Iterate through the Account records
        for ( Account acc : accounts) 
        {
            // Clone (copy) the Contact record, make the clone a child of the specific Account record and add to the list of contacts
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        
        insert contacts;
    }
}