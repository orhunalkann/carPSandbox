@isTest
private class LeadProcessorTest {
    @TestSetup
    static void setup(){
        list<Lead> lq = new List<Lead>();
        for(integer i=0; i<200; i++){
            lq.add(new Lead(LastName='Testing batchs' + i, company='Testing trailhead'));
        }
        insert lq;
    }

    @isTest static void testt(){
        Test.startTest();
        LeadProcessor testPro = new LeadProcessor();
        id batchId = database.executeBatch(testPro, 200);
        Test.stopTest();
        system.debug('batchId: ' + batchId);

        System.assertEquals(200, [select id from Lead where LeadSource = 'dreamforce'].size(), 'at least 1 record is not updated');
    }
    
    
}