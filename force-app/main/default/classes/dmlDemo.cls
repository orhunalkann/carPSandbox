public class dmlDemo {
    public static void dmlInsertDemo_stnObj1() {
        // Create new instance of sObject
        account acc = new account();
        // set fields
        acc.name = 'SoftInnovas';
        // set other fields
        acc.phone = '955888425';
        acc.type = 'customer - Direct';
        // insert
        insert acc;

    }

    public static void dmlInsertDemo_cstObj1() {
        //new instance
        salesforce_project__c sp = new salesforce_project__c();
        sp.project_name__c = 'Teach DML to super Batch10';
        sp.description__c = 'all are doing great';
        sp.status__c = 'new';
        //insert
        insert sp;
    }

    public static void dmlUpdateDemo1() {
        account acc = new account();
        acc.name = 'anything';
        system.debug('before insert ==>' + acc.name);
        insert acc;
        system.debug('after insert ==>' + acc.name);

        //update account name
        acc.name = 'SoftInnovas INC.';
        update acc;
        system.debug('after update ==>' + acc.name);
    }

    public static void dmlUpdateDemo2() {
        account acc = [select id, name from account where name = 'SoftInnovas INC.'];

        //update name
        acc.name = 'Updated SoftInnovas INC.';
        update acc;
    }
}