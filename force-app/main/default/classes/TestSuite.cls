public with sharing class TestSuite {
    public static Case createCase(String origin, String priority){
        Case cs = new Case();
        cs.Subject = 'Test Subject';
        cs.Description = 'Test Description';
        cs.Priority = priority;
        cs.Origin = origin;
        return cs;
    }
}
