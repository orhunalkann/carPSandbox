public class AccountHandler {
    /*public static void updateVIPforAllContacts(List<account> accTriggerNew, List<account> accTriggerOld, 
        Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        // get accounts fro which VIP is changed

        set<id> setAccIDs = new Set<id>(); // <== bu set degisecek contactlari eslemek icin gerekli olan 'id' from account
        for (account eachAcc : accTriggerNew) {
            if(eachAcc.VIP__c != accTriggerOldMap.get(eachAcc.id).VIP__c){
                setAccIDs.add(eachAcc.id);
            }
        }
        //all contacts for all those accounts
        list<contact> listContact = [select id, vip__c, accountid, name from contact where accountid in :setAccIDs];
        if(!setAccIDs.isEmpty()){
        for(contact eachContact : listContact){
            account acc = accTriggerNewMap.get(eachContact.accountid);
            boolean accVip = acc.VIP__c;
            eachContact.VIP__c = accVip;
        }
        update listContact;

    }
    }*/

    public static account insertNewAccount(string nameq){
        
        try {
            Account acct = new Account(name=nameq);
            insert acct;
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
            return null;
        }
    }
    
}