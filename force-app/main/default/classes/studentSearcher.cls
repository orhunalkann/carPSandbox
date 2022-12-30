public with sharing class studentSearcher {
    @AuraEnabled
    public static List<Student__c> studentSearcher(String post) {
        post = '%' + post + '%';
        return [SELECT Student_Name__c, Class__c, Mobile__c, Email__c, Postal_Code__c
                FROM Student__c
                WHERE Postal_Code__c LIKE :post
                WITH SECURITY_ENFORCED];
    }
}
