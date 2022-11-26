public class ContactUtility {
    public static void viewContacts(){
        list<contact> listOfContacts = [select firstname, lastname from contact];
        system.debug(listOfContacts.size());
        for (contact a : listOfContacts){
            string fullname = 'First name: ' + a.firstname + ' Last name: ' + a.lastname;
            //system.debug(fullname);
            system.debug(a);
            
        }
    }
}