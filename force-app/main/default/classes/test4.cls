/*Deleting Records*/
public class test4 {
    public static void main(){
        Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName='Smith']; 
		delete contactsDel;
    }

}