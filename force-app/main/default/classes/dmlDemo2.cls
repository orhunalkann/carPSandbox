public class dmlDemo2 {
    public static void dmlInsertDemo2() {
        account acc = [select id, name from account order by createddate desc limit 1];

        contact cnt = new contact();
        cnt.Lastname = 'Biden';
        
        //establish relationship with account
        cnt.accountid = acc.id;
        insert cnt;
        
        system.debug(acc);
    
    }

    public static void dmlInsertDemo3() {
        salesforce_project__c sp = [select id from salesforce_project__c order by createddate desc limit 1];

        //create new ticket
        salesforce_ticket__c st = new salesforce_ticket__c();
        st.subject__c = 'Learn Apex DML';
        st.priority__c = 'High';
        st.status__c = 'New';
        st.requested_by_date__c = date.newInstance(2022, 9, 09);
        
        st.salesforce_project__c = sp.id;
        insert st;
    }

    public static void dmlInsertDemo4() {
        
        //liste kurarak DML execution sinirlamsindan kacabiliyoruz. 
        //Listeye insert edilcek accountlari(objeleri) atip, 
        //listeyi insert ediyoruz. sonuc olarak 1 dml execution ile 1 den cok record insert edebilme ikanimiz oluyor.
        
        list<account> listAcc = new list<account>();

        account acc = new account();
        acc.name = 'acc blul1';
        acc.phone = '23232323';
        listAcc.add(acc);

        account acc1 = new account();
        acc1.name = 'acc blul212';
        acc1.phone = '255112';
        listAcc.add(acc1);
        
        account acc3 = new account();
        acc3.name = 'acc b';
        acc3.phone = '2523232312';
        listAcc.add(acc3);

        insert listAcc;
    }

    public static void dmlMultipleRecord_right2(){

        list<account> listAcc = new list<account>();
        for (integer i = 0; i<155; i++){
            account acc = new account();
            acc.name = 'SoftInnovas 30ct v.' + i;
            acc.phone = '800222000' + i;
            acc.active__c = 'Yes';
            listAcc.add(acc);
        }
        insert listAcc;
    }
    public static void dmlMultipleRecord_right3(){
        list<account> listAcc = [select id, name, phone from account limit 155];

        list<account> updateAccList = new list<account>();

        for (account each : listAcc) {
            each.name += 'via B.O';
            updateAccList.add(each);
        }

        if(!updateAccList.isEmpty()){
            update updateAccList;
        }
    }
}
