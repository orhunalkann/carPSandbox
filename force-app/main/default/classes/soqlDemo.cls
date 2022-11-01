public class soqlDemo {
    public static void accountsoql_1() {
        list<account> listAcc = [select id, name, phone, active__c from account where name like '%a'];
        system.debug('account list: ' + listAcc);
    

        account soql_2 = [select id, name, phone, active__c from account where name != '' limit 1];
        system.debug('account soql_2: ' + soql_2);
    }

    public static void accountsoql_2() {

        account acc = [select id, name, phone, accountnumber from account order by createddate desc limit 1];
        system.debug('acc is: ' + acc);
        
        string accName = acc.name;
        string accPhone = acc.phone;
        system.debug('acc name: ' + accName);
        system.debug('acc phone: ' + accPhone);
        system.debug('account number: ' + acc.accountnumber);

    }

    public static void accountsoql_3(){
        list<account> listAcc = [select id, name, phone, accountnumber from account order by createddate desc];
        system.debug('listacc is' + listacc);

        for(account acc : listAcc){
            string accName = acc.name;
            system.debug('account ==>' + accName);
            system.debug('acc phone: ' + acc.phone);
            system.debug('account number: ' + acc.accountnumber);
            
        }}

        public static void accsoql_filter(){
            string accName = 'Salesforce Inc.';
            list<account> listAcc = [select id, name from account where name = :accName];
            system.debug(listAcc);



        }
        public static void accsoql_filter1(string accName){
            list<account> listAcc = [select id, name from account where name = :accName];
            system.debug(listAcc);
        }
}
