@isTest
private class TestVerifyDate {
    @isTest static void CheckDatesTest() {
        date tet = VerifyDate.CheckDates(system.today(), system.today()+1);
        date tet2 = VerifyDate.CheckDates(system.today(), system.today()+150);
        
    }
    
    
}
