@isTest
public with sharing class TestRestrictContactByName {
    @isTest static void TestRestrictContact() {
        contact newContact = new contact();
        newContact.lastname = 'alaa';
        insert newContact;
    }
}
