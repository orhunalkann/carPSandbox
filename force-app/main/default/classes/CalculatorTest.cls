@isTest
private class CalculatorTest {
    @isTest static void returnMassageTest(){
        String tet = Calculator.printAndReturnMessages('Orhun');
        system.assertEquals('Orhun...OK cool', tet);
    }
    @isTest static void addTest(){
        integer tet8 = Calculator.add(3,5);
        system.assertEquals(8, tet8);
    }
    @isTest static void lengthTest() {
        integer tet = Calculator.calculateStringLength('Orhun');
        system.assertEquals(5, tet);
    }
}