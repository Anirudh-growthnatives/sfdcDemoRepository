public class AccountHandler {
    public static Account insertNewAccount (String accountname){
        try{
            Account acc = new Account(Name = accountname);
            insert acc;
            return acc;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
        
    }
    
}