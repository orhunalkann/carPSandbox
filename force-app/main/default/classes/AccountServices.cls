@RestResource(urlMapping='/Account/*')
global with sharing class AccountServices {
    
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        String accId = uri.substringAfterLast('/');
        Account acc = [SELECT Id, Name, Phone FROM Account WHERE Id = :accId];
        return acc;
    }
    @HttpPost
    global static Id postAccount(String Name, String Tier, String BillingState){
        Account acc = new Account();
        acc.Name = Name;
        acc.Support_Tier__c=Tier;
        acc.BillingState=BillingState;
        insert acc;
        return acc.Id;
    }
    @HttpPut
    global static Id putAccount(String Id, String Name, String Tier){
        Account acc = new Account();
        acc.Id = Id;
        acc.Name = Name;
        acc.Support_Tier__c=Tier;
        upsert acc;
        return acc.Id;
    }
    @HttpPatch
    global static Account patchAccount(){
        RestRequest request = RestContext.request;
        String jsonStr = request.requestBody.toString();
        Account acc = (Account) JSON.deserialize(jsonStr, Account.class);
        update acc;
        Account accQue = [SELECT Id, Name, Support_Tier__c FROM Account WHERE Id = :acc.Id];
        return accQue;
    }
}
