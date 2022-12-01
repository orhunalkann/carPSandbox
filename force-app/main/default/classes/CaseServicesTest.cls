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
}
