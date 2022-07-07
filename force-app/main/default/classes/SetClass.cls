public class SetClass {
    public static void myMethod ()
{
   // ******* SET INITILIZATION *****
  
    /*
     Set<Datatype> s e new Set<Datatype>();
    */
   
    // Creating & Initializing an Integer set
   
    Set<Integer> s1 = new Set<Integer>();
   
    //Adding values to the Set
   
    s1.add(2);
    s1.add(4);
    s1.add(6);
    s1.add(4);

    //Initializing and adding values together
   
    Set<Integer> s2 = new Set<Integer>{2,4,6,4};
        
   // A string type Set
   
        Set<String> s3 = new Set<String>{'This','is', 'how', 'we', 'do', 'it'};

   // Uniqueness of sobjects

    Set<Account> sSet = new Set<Account>();

    Account al = new Account (Name = 'Amazon', NumberofEmployees = 20000); // Will Work
    Account a2 = new Account (Name = 'Walmart', NumberOfEmployees = 20000);// Will Work
    Account a3 = new Account (Name ='Amazon', NumberofEmployees = 20000); //// Will Not Work Duplicate Element a1
    Account a4 = new Account (Name ='Amazon'); // Will Work
    // A sobject is considered duplicate in a set when "ALL" it's field value match with a previous element in the set
    
    sSet.add(al);
    sSet.add(a2);
	sSet.add(a3);
	sSet.add(a4);
    
    System.debug(sSet.size());  // 3
	
    // Methods of Sets

    List<Integer> l1 = new List<Integer>{3,6,9};
        }
}