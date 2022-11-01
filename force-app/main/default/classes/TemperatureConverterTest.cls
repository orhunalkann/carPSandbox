@isTest
public with sharing class TemperatureConverterTest {
    @isTest static void testWarmUp() {
        Decimal celcius = TemperatureConverter.FahrenheitToCelsius(70);
        system.assertEquals(21.11, celcius);
    }
    @isTest static void testFreezingPoint() {
        Decimal celcius = TemperatureConverter.FahrenheitToCelsius(32);
        
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);        
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    } 
}
