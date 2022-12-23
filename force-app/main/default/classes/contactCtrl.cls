public with sharing class contactCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getChildCntc(String accId) {
        return [SELECT Id, FirstName, LastName, AccountId, Email, Phone 
                FROM Contact
                WHERE AccountId =:accId
                WITH SECURITY_ENFORCED
                LIMIT 5];
    }
}
