public class RandomContactFactory {
    public static list<contact> generateRandomContacts(integer numberOfnames, string lastName) {
        list<contact> listContacts = new list<contact>();

        for (integer i = 0; i < numberOfnames; i++) {
            contact c = new contact();
            c.lastName = lastName;
            c.firstname = c.firstname + i;
            listContacts.add(c);
            
        }

        return listContacts;
    }
}