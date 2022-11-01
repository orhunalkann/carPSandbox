@isTest
public class DailyLeadProcessorTest {
    @TestSetup
    static void makeData(){
        list<Lead> listL = new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead l = new Lead();
            l.lastName = 'Test'+ i;
            l.Company = 'Salesforce';
            listL.add(l);
        }
        insert listL;
    }

    @isTest 
    static void tester(){
        Test.startTest();
        DailyLeadProcessor asd = new DailyLeadProcessor();
        String sch = '0 25 22 26 10 ?';
        system.Schedule('My first schedule', sch, asd);
        Test.stopTest();

        //assertion

        list<lead> checkList = [select Id, LeadSource from Lead where LeadSource='Dreamforce'];
        system.assertEquals(200, checkList.size());

    }
}
