@isTest
public with sharing class CaseServicesTest {
    @TestSetup
    private static void makeData(){
        List<Case> Cases = new List<Case>();
        for(integer i = 0; i <3; i++){
           case cs = TestSuite.createCase('Web', 'High');
           cases.add(cs);
        }
        insert cases;
    }

    /*@isTest
    private static void getCaseTest(){
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'GET';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        Case caseob = CaseServices.getCase();
        System.assertEquals(cs.Id, caseob.Id);
        Test.stopTest();
    }*/

    @isTest 
    private static void getCaseTest() {
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'GET';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        Case csObj = CaseServices.getCase();
        System.assertEquals(cs.Id, csObj.Id);
        Test.stopTest();
    }


    @isTest
    private static void postCaseTest(){
        Test.startTest();
        Id caseId = CaseServices.postCase('High', 'Email','Test', 'Test Subject', 'New');
        System.assertNotEquals(caseId, null);
        Test.stopTest();
    }

    /*@isTest
    private static void deleteCaseTest(){
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'GET';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        String status = CaseServices.deleteCase();
        System.assertEquals('Deleted', status);
        Test.stopTest();
    }*/
    @isTest 
    private static void deleteCaseTest() {
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'DELETE';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        String status = CaseServices.deleteCase();
        System.assertEquals('Deleted', status);
        Test.stopTest();
    }

    @isTest
    private static void putCaseTest(){
        Test.startTest();
        //1. insert a new Case
        Id caseId = CaseServices.putCase(null, 'High', 'Phone', 'Some Subj', 'Some Description', 'New');
        system.assertNotEquals(null, caseId);
        //2. take id and edit field. Update with case id.
        Id caseId2 = CaseServices.putCase(caseId, 'Medium', 'Email', 'Some Subj Updated', 'Some Description Updated', 'New');
        system.assertEquals(caseId, caseId2);
        Test.stopTest();
    }

    @isTest
    private static void patchCaseTest(){
        //prepare RestRequest
        Test.startTest();
        Case cs = [SELECT Id, Priority, Origin, Subject, Description, Status FROM Case WHERE Priority = 'High' LIMIT 1];
        cs.Priority = 'Low';
        String jsonString = JSON.serialize(cs);
        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueof(jsonString);
        request.httpMethod = 'PATCH';
        //prepare RestContext
        RestContext.request = request;
        //perform test
        Case updatedCase = CaseServices.patchCase();
        System.assertEquals('Low',updatedCase.Priority);
        Test.stopTest();

    }
}
