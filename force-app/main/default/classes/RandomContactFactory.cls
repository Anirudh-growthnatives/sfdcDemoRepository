public class RandomContactFactory {
    public static List<Contact>  generateRandomContacts(Integer num, String lastname) {
        List<Contact> conts = new List<Contact>();
        for(Integer i = 0; i < num; i++) {
            Contact c = new Contact(FirstName='Test ' + i, LastName = lastName);
            conts.add(c);
        }
        return conts;

}
}