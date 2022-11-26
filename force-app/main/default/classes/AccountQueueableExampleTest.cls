@isTest
public class AccountQueueableExampleTest {
    
    @TestSetup
    static void makeData(){
        list<account> listAcc = new List<Account>();
        // add 100 accounts

        for(integer i = 0; i < 100; i++){
            listAcc.add(new Account(name = 'Test Account'));
        }
        insert listAcc;
    }

    static testMethod void testQueueable(){
        //query for test data to pass to queueable class
        list<Account> accountToPass = [select id, name from account];

        AccountsQueuableExample aq = new AccountsQueuableExample(accountToPass);

        Test.startTest();
        system.enqueueJob(aq);
        Test.stopTest();
        
        //asertion

        list<account> checkList = [select id, name from account where name like '%SI'];
        system.assertEquals(100, checkList.size());
    }
}