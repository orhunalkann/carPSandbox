@isTest
public class AccountProcessorTest {
    @isTest 
    private static void AccountProcessor(){

        Account acc1 = new Account();
        acc1.name = 'ahmet';
        Account acc2 = new Account();
        acc2.name = 'ahmet2';
        Account acc3 = new Account();
        acc3.name = 'ahmet3';
        
        list<account> listAcc = new list<account>{acc1, acc2, acc3};
        insert listAcc;
        list<Contact> connss = new list<Contact>();
        list<Id> accIds = new list<Id>();
        for (account aac: listAcc){
            connss.add(new Contact(FirstName=aac.name, LastName='Test contact', AccountId=aac.id));
            accIds.add(aac.id);
        }
        
            
        
        insert connss;
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        

        list<account> check = [select id, number_of_contacts__c from account];

        system.debug(check[0].Contacts.size());
        system.assertEquals(1, check[0].number_of_contacts__c);
    }
}
