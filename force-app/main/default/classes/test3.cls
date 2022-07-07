/*Upserting Records*/
public class test3 {
    public static void main(){
        
        	Contact ane = new Contact(FirstName='Jane',
                                      LastName='Smith',
                                      Email='jane.smith@example.com',
                                      Description='Contact of the day');
			insert ane;

        // 1. Upsert using an idLookup field
		// Create a second sObject variable.
		// This variable doesn’t have any ID set.

        	Contact ane2 = new Contact(FirstName='Jane',
                         				LastName='Smith',  
                         				Email='jane.smith@example.com',
                         				Description='Prefers to be contacted by email.');

        // Upsert the contact by using the idLookup field for matching.
			upsert ane2 Contact.fields.Email;

        // Verify that the contact has been updated
			System.assertEquals('Prefers to be contacted by email.',
			   [SELECT Description FROM Contact WHERE Id=:ane.Id].Description);
        		
        	 //[SELECT Description FROM Contact WHERE Name = 'Jane Smith'].Description);
    }

}