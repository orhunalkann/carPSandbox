public class soqlDemo2 {
    public static void childToParent_soql1() {
        list<contact> listCnt = [select id, name, account.name from contact where account.industry = 'Energy'];
        //system.debug(listCnt);

        for(contact cnt : listCnt) {
            string accName = cnt.account.name;
            system.debug('contact name is ' + cnt.name + ' and contacts account name is ' + accName);
        }
    }

    public static void parentToChild_soql2() {
        list <account> listAccWithOps = [select id, name, annualrevenue, type, (select id, name, amount, stagename from opportunities where stagename = 'Closed Won') from account where type = 'Customer - Direct'];

        for(account eAcc : listAccWithOps) {
            system.debug('account name is ' + eAcc.name + ' and annual revenue is ' + eAcc.annualrevenue);
            list<opportunity> listOpp = eAcc.opportunities;
            for (opportunity eOpp : listOpp) {
                system.debug('opportunity name is ' + eOpp.name);
                system.debug('opportunity amount is ' + eOpp.amount);
                system.debug('=============');
                

            }
        }
        system.debug('===Finished====');
    }
    
    public static void parentToChild_soql3() {
        list<salesforce_project__c> listSP = [select id, name, project_name__c, 
                            (select priority__c, name from salesforce_tickets__r) 
                            from salesforce_project__c];
        for (salesforce_project__c eachSP : listSP) {
            system.debug('project name is ' + eachSP.project_name__c);
            List<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r; 
            //how to get count of the list?
            integer totalTickets = listST.size();
            system.debug('total tickets in project is ' + totalTickets);
        }
    }
}
