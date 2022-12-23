public with sharing class accountCtrlAssignmet4 {
    @AuraEnabled
    public static List<Account> getAccs(String searchKey){
        return [SELECT Name, Type, AnnualRevenue, Industry
                FROM Account
                WHERE Industry = :searchKey
                WITH SECURITY_ENFORCED];
    }
}
