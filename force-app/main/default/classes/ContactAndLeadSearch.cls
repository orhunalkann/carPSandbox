public with sharing class ContactAndLeadSearch {
    public static  List<List< sObject>> searchContactsAndLeads(string LastName) {
            list<list<sObject>> xList = [Find :LastName IN ALL FIELDS RETURNING Contact(LastName), Lead(FirstName, LastName, Company)];
            return xList;
    }
}