global with sharing class ContactController {
    
    @AuraEnabled(cacheable=true)
        global static List<Contact> getContacts(Id contactId){
        try {
            return [SELECT FirstName, LastName, Email FROM Contact WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            //throw new AuraHandledException(e.getMessage());
            throw new AuraHandledException('Forced error');
        }
    }
    
}



