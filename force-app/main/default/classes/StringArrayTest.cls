public class StringArrayTest {
    //This is the method to generate the string
    public static List<String> generateStringArray (Integer n){
        List<String> myArray = new List<String>();
        for (Integer i=0;i<n;i++){
            myArray.add( 'Test ' + i);
            system.debug(myArray[i]);
        }
        return myArray;
    }
}