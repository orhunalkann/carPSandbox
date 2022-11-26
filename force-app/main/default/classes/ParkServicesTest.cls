@isTest
public with sharing class ParkServicesTest {
    @isTest
    public static void getParksbyCountry(){
        Test.startTest();
        soapParkServicesCallOutMock mock = new soapParkServicesCallOutMock();
        Test.setMock(WebServiceMock.class, mock);
        string country = 'Japan';
        String[] parks =  SoapCallOuts.getParksbyCountry(country);
        Test.stopTest();
        system.assertEquals(2, parks.size());
    }
}
