public class AccountProcessor {
	
    @future
    public static void countContacts(list<Id> accountIds){
        list<Account> accS = [select Id, (select id From Contacts) From Account Where Id IN :accountIds];
        
        for(Account acc: accS){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        update accS;
    }
}