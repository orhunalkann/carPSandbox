@isTest
public with sharing class restPostCallOutTest {
    @isTest
    private static void postAnimalsTest(){
        restPostCalloutMock mockS = new restPostCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        HttpResponse response = restPostCallOut.postAnimal();
        system.assertEquals(201, response.getStatusCode());
        system.assertEquals('Created', response.getStatus());
    }
    @isTest
    private static void postGoRestObjTest(){
        //prepare test records
        Gorest_Contact__c con = new Gorest_Contact__c();
        con.name = 'Elon';
        con.Gender__c = 'Male';
        con.Email__c = 'elon@example.com';
        con.Status__c = 'OK';
        insert con;
        
        restPostCalloutMock mockS = new restPostCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        Test.startTest();
        HttpResponse response = restPostCallOut.postGoRestObj();
        Test.stopTest();
        system.assertEquals(201, response.getStatusCode());
        system.assertEquals('Created', response.getStatus());
    }
}