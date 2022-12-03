public with sharing class AccountUpdateHelper {
    @invocableMethod
    public static void AccountUpdateWebsite(list<id> accIds) {
        list<account> AccountsToUpdate = new List<account>();
        for(account acc : [select id, website from account where id in :accIds]) {
            acc.website = 'wwww.softinnovas.com';
            AccountsToUpdate.add(acc);
        }
        if (AccountsToUpdate != null) {
            update AccountsToUpdate;
        }
    }
}