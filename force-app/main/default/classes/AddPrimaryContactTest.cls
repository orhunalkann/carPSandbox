@isTest
public class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){
        list<account> accs = new List<account>();
        for (integer i = 0; i <100 ; i++) {
            
            account acc = new account();
            if(i<50){
                acc.name = 'Trailhead ';
                acc.billingstate = 'NY';
                accs.add(acc);
            }else if (i<100){
                acc.name = 'Trailhead ';
                acc.billingstate = 'CA';
                accs.add(acc);

            }    
        }
        insert(accs);

        contact co = new contact();
        co.lastName = 'Setup';
        insert co;
    }

        @isTest static void AddPrimaryContactTest(){

        contact co = [select id from contact where lastName = 'Setup'];

        Test.startTest();
        AddPrimaryContact ass = new AddPrimaryContact(co, 'CA');
        system.enqueueJob(ass);
        Test.stopTest();

        //asertion

        list<account> ac1 = [select id  from account where billingstate = 'CA'];
        list<contact> co1 = [select id from contact where lastName = 'Setup'];
        system.assertEquals(ac1[0].id, co1[0].AccountId);

    }
}
