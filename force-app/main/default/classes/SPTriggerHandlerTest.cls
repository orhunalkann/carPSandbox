@isTest
public class SPTriggerHandlerTest {
    @isTest
    private static void testUpdateDescFutures() {
        //1. Prepare Data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Teach DML to super Batch 10';
        sp.Description__c = 'All are doing great.';
        sp.Status__c = 'New';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Teach DML to super Batch 10';
        sp2.Description__c = 'All are doing great.';
        sp2.Status__c = 'New';

        List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2};
        insert listSP;

        set<id> spIds = new set<id> {sp.id, sp2.id};
        //2. test.start test
        Test.startTest();
            //2.2 call future
        SFProjectTriggerHandler.updateDescripton(spIds);
       //2.2 stop test
        Test.stopTest();
    //3. assert
        list<Salesforce_Project__c> resultSp =[select id, description__c from Salesforce_Project__c];
        system.assert(resultSp[0].description__c.contains('future'));
    }
}