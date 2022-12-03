@isTest
public with sharing class restCalloutsTest {
    @isTest
    private static void getAnimalsTest(){
        restCalloutMock mockS = new restCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        HttpResponse response = RestCallOutsInnovas.getAnimals();
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
    }
    @isTest
    private static void getBlogTest(){
        restCalloutMock mockS = new restCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        HttpResponse response = RestCallOutsInnovas.getBlogs();
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
    }
    @isTest
    private static void getProductTest(){
        restCalloutMock mockS = new restCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        HttpResponse response = RestCallOutsInnovas.getProducts();
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
    }
    @isTest
    private static void getContactTest(){
        restCalloutMock mockS = new restCalloutMock();
        test.setMock(HttpCalloutMock.class,mockS);
        HttpResponse response = RestCallOutsInnovas.getContactUsers();
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
    }
}