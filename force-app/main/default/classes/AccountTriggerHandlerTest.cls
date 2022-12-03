@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void testUpdateDescripton1() {
        Account acc = new account();
        acc.name = 'SI Test';
        acc.Industry = 'Energy';
        acc.Active__c = 'Yes';

        Account acc2 = new account();
        acc2.name = 'UI Test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';

        Account acc3 = new account();
        acc3.name = 'PI Test';
        acc3.Industry = 'Banking';
        List<account> listAcc = new list<account>{acc, acc2, acc3};
        //dml automatically call the trigger
        insert listAcc;
        // check if active updated
        acc.name='test s1';
        acc3.Active__c = 'Yes';
        update acc;
        update acc3;
        //system.assert(listAcc[2].description.contains('active.'));
        //assertion
        list<account> accounts = [select id, description, Active__c from account where Active__c = 'Yes'];
        system.assert(accounts[0].description.contains('Enjoy!'));
    }
    
    @isTest
    private static void testUpdateVIPforAllContacts() {
        account acc = new account();
        acc.name = 'Test 1.11';
        acc.Industry ='Energy';
        acc.vip__c = false;
        
        account acc2 = new account();
        acc2.name = 'Test 2.11';
        acc.Industry = 'Energy';
        acc2.VIP__c = false;
        
        list<account> listAccounts = new list<account>{acc, acc2};
        insert listAccounts;

        list<contact> listContacts = new list<contact>();
        for (integer i = 0; i<200; i++) {
            contact c = new contact();
            c.LastName = 'trigger test ' +i;
            if(i<100){
                c.AccountId = acc.id;
            }else if (i<200){
                c.AccountId = acc2.id;
            }
            listContacts.add(c);
        }
        insert listContacts;
        
        acc.Vip__c = true;
        acc2.Vip__c = true;
        list<account> listAcc2 = new list<account>{acc, acc2};
        update listAcc2;

        //assertion
        //check all contact's vip field is true.
        list<contact> contacts = [select id, vip__c, name from contact];
        system.assertEquals(true, contacts[0].VIP__c);


    }
}