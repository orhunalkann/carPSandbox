public without sharing class LeadProcessor implements database.Batchable<sObject> {
    integer counter=0;
    //1. Start
    public Database.QueryLocator start(Database.BatchableContext ct){

        Database.QueryLocator ql = database.getQueryLocator([select Id from Lead]);
        return ql;
    }

    //2  Execute 

    public void  Execute(Database.BatchableContext ct, list<Lead> scope){

        for(Lead ld : scope){
            ld.LeadSource = 'Dreamforce';
        }
        update scope;
        counter++;
    }
    //3  Finishe

    public void  finish(Database.BatchableContext ct){
        system.debug(counter);
    }
    
}
