@isTest
public class emplAge_Test 
{
    @isTest
    static void emplAge_test_1()
    {
 		try{
     Employee__c Ani1 = new Employee__c (Name = 'Anirudh1', Date_of_Birth__c = date.newInstance(2012, 12, 15));
        insert Ani1;
 	}
         catch(Exception e)
        {       
			//System.assert(e.getMessage().contains('Error : Birth Day Date Cant be Future Date'));
        } 
    }
    
    @isTest
    static void emplAge_test_2(){
 try{
        
     	Employee__c Ani2 = new Employee__c (Name = 'Anirudh2', Date_of_Birth__c = date.newInstance(2023, 05, 25));
        insert Ani2;
 	}
         catch(Exception e)
        {       
			//System.assert(e.getMessage().contains('Error : Birth Day Date Cant be Future Date'));
        }

    }

}