public with sharing class AddPrimaryContact implements Queueable {
    private string str;
    private Contact con;
    public AddPrimaryContact(Contact inputCon, string inputStr) {
        this.con = inputCon;
        this.str = inputStr;
    }

    public void execute(QueueableContext context){
        
        //retrive 200 Account records
        list<account> accs = [select id from account where billingstate = :str limit 200];

        //create a empty list of contact records
        list<contact> conss = new list<contact>();

        //iterate through the account records
        for(account acc : accs){
        
            // clone the contact record, make the clone a child of the specific account record
            // and add to the list of contact

            contact contClone = con.clone();
            contClone.AccountId = acc.id;
            conss.add(contClone);
        }

        insert conss;
    }
}
