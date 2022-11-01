@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority() {
        String pri = TaskUtil.getTaskPriority('NY');
        system.assertEquals('Normal', pri);
    }
    @isTest static void testHighPriority() {
        String pri = TaskUtil.getTaskPriority('CA');
        system.assertEquals('High', pri);
    }
    @isTest static void testNullPriority() {
        String pri = TaskUtil.getTaskPriority('CAA');
        system.assertEquals(Null, pri);
    }
    @isTest static void testNullPriority2() {
        String pri = TaskUtil.getTaskPriority(' ');
        system.assertEquals(Null, pri);
    }
}