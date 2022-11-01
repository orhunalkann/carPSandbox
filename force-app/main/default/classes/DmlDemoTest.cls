@isTest
public with sharing class DmlDemoTest {
    @isTest
    public static testDmlInsert1() {
        DmlDemo.dmlInsertDemo_stnObj1();

        list<account> listAcc = [select id, name from account where name = 'Soft Innovas'];
        system.assertEquals(1, listAcc.size());
        system.assertEquals('Soft Innovas', listAcc[0].name);
    }
}
