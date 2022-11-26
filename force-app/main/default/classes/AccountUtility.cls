public class AccountUtility {
    public static void viewAnnualRevenue(){
        list<account> accountsList = [select name, annualRevenue from account];
        for(account account : accountsList){
            string acctRev = account.name + ' : '+ account.annualRevenue;
            system.debug(acctRev);
                
        }
    }
}