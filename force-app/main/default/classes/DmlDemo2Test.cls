@isTest
public class DmlDemo2Test {
    @isTest
    public static void dmlInserDemo2Test() {
        //prepare the data (kodda account query oldugu icin account kurup insert ettim)
        account acc = new account(name='SoftInnovas');
        insert acc;
        
        //call the method
        DmlDemo2.dmlInsertDemo2();

        //assert, how to check! (kodda contact lastName bide oluyor, Biden soyadi ariyan bi query kurup contact kurulsmu kontrol ediyoruz)
        //Ayni zamanda acc.id ile contact uzerindeki accoundId feild ile islesme olup olmadigina bakiyoruz.
        list<contact> listCtn = [select id, lastname, accountId from contact where lastName  = 'Biden'];
        system.assertEquals(1, listCtn.size());
        system.assertEquals(acc.id, listCtn[0].accountId); 

    }
    @isTest
    public static void dmlInsertDemo3(){
        //prepare Data
        salesforce_project__c sp = new salesforce_project__c();
        sp.project_name__c = 'Teach DML to super Batch 10';
        sp.description__c = 'All are doing great, still...';
        insert sp;
    
        //call the method
        dmlDemo2.dmlInsertDemo3();
    
        //asertion
    
        list<salesforce_ticket__c> listSft = [select id, subject__c, salesforce_project__c from salesforce_ticket__c where subject__c = 'Learn Apex DML'];
        system.assertEquals(1, listSft.size());
        system.assertEquals(sp.id, listSft[0].salesforce_project__c);
    }
}


