@isTest
private class TemperatureConverterTest {
    @isTest static void testWarmTemp() {
        Decimal Fahrenheit = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11,Fahrenheit);
    }
    @isTest static void testFreezingPoint() {
        Decimal Fahrenheit = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0,Fahrenheit);
    }
   /* @isTest static void testBoilingPoint() {
        Decimal Fahrenheit = TemperatureConverter.FahrenheitToCelsius(212);        
        System.assertEquals(100,Fahrenheit,'Boiling point temperature is not expected.');
    } */
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);        
        // Simulate failure
        System.assertEquals(0,celsius,'Boiling point temperature is not expected.');
    }
    @isTest static void testNegativeTemp() {
        Decimal Fahrenheit = TemperatureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33,Fahrenheit);
    }
}