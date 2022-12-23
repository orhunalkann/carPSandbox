public with sharing class contactCtrl2 {
    @AuraEnabled
    public static List<Contact> getMatchingContacts(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT FirstName, LastName, Title, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}
