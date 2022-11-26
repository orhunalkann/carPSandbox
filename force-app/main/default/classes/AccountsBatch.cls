//To write a Batch Apex class, your class must implement 
//the Database.Batchable interface and include the following three methods

//1 - Start
//2- Execute
//3-finish

public class AccountsBatch implements Database.Batchable<sObject>{
    integer count  = 0;
    
    //1. start method.
    public database.QueryLocator start(Database.BatchableContext bc){
        //soql to fetch records
        //on account records
        system.debug('Batch started. ');
        Database.QueryLocator ql = database.getQueryLocator([select id, description from account]);
        return ql;

    }

    public void execute(Database.BatchableContext bc, list<account> scope){
        system.debug('we are in execute method NOW. ');
        for (account acc : scope) {
            acc.Description += '...updated via batch';
            system.debug('----------------');
        }
        count++;
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        system.debug('batch execution finished. Done. Simple? right?');
        system.debug(count +'<==count ');
        
    }
}