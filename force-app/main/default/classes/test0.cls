public class test0 {
    public static void main(){
        Account acc = new Account(Name='Acme', Phone='(415)555-1212');
        acc.NumberOfEmployees = 100;
        insert acc;
        ID accID = acc.Id;
        System.debug('ID = ' + accID);
        Account acc2 = new Account(Phone='(475)555-1212');
        acc2.Name = 'Aci';
        insert acc2;
        
    }
    
}