@isTest
public class CalculatorSimpleTest {
    @isTest 
    private static void Test1() {
        integer sum = calculatorSimple.add1(10,15);
        //integer expectedValue = 25;
        system.assertEquals(25, sum);
    }
    @isTest
    private static void Test2() {
        integer sum = calculatorSimple.add2(10,15,10);
        integer expectedValue = 35;
        system.assertEquals(35, sum);
    }
}