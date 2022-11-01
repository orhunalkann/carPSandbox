public with sharing class AccountsQueuableExample implements Queueable {
    list<account> listAccount;
    public AccountsQueuableExample(list<account> Acc) {
        listAccount = Acc;
    }

    public void execute(QueueableContext qc){
        for(Account ac : listAccount){
            ac.name = ac.name + ' --SI';
        }
        update listAccount;
    }
}

// Queueable methods can be called in trigger (trigger.new give a list that you can pass as params)
