@isTest
private class FlightControllerTest {


    @TestSetup
    static void insertAirports(){
       Airport__c  arrivalAirport = new Airport__c(Name='Arrival Airport', IATA__c='AAA', Location__latitude__s=0, Location__longitude__s=0);
       Airport__c departureAirport = new Airport__c(Name='Departure Airport', IATA__c='BBB', Location__latitude__s=0, Location__longitude__s=0);
        
        insert new List<Airport__c>{arrivalAirport, departureAirport};
    }

    @isTest 
    static void successFullyInsert()
    {
        
        // Test case 1: Successful insertion
        Test.startTest();
        Airport__c arrivalAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Arrival Airport'];
        Airport__c departureAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Departure Airport'];
        FlightController.FlightResultWrapper result = FlightController.addNewFlight(arrivalAirport.IATA__c, departureAirport.IATA__c);
        Test.stopTest();
        System.assertEquals(FlightController.FLIGHT_INSERT_SUCCESSFUL, result.message);
    }

    @isTest
    static void arrivalAirportNotFound()
    {
        Airport__c arrivalAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Arrival Airport'];
        Airport__c departureAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Departure Airport'];
        // Test case 2: Arrival airport not found
        Test.startTest();
        FlightController.FlightResultWrapper result = FlightController.addNewFlight('XXX', departureAirport.IATA__c);
        Test.stopTest();
        System.assertEquals(FlightController.ARRIVAL_AIRPORT_NOT_FOUND, result.message);

    }

    @isTest
    static void departureAirportNotFound()
    {
        Airport__c arrivalAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Arrival Airport'];
        Airport__c departureAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Departure Airport'];
         // Test case 3: Departure airport not found
         Test.startTest();
         FlightController.FlightResultWrapper result = FlightController.addNewFlight(arrivalAirport.IATA__c, 'YYY');
         Test.stopTest();
         System.assertEquals(FlightController.DEPARTURE_AIRPORT_NOT_FOUND, result.message);
    }

    @isTest
    static void noAirportsFound()
    {
        Airport__c arrivalAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Arrival Airport'];
        Airport__c departureAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Departure Airport'];
        // Test case 4: No airports found
        Test.startTest();
        FlightController.FlightResultWrapper result = FlightController.addNewFlight('XXX', 'YYY');
        Test.stopTest();
        System.assertEquals(FlightController.NO_AIRPORTS_FOUND, result.message);
    }

    @isTest 
    static void flightAlreadyExists()
    {   Airport__c arrivalAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Arrival Airport'];
        Airport__c departureAirport = [SELECT Name, IATA__C,Location__latitude__s, Location__longitude__s FROM Airport__c WHERE Name ='Departure Airport'];
        FlightController.FlightResultWrapper result = FlightController.addNewFlight(arrivalAirport.IATA__c, departureAirport.IATA__c);
        Test.startTest();
        FlightController.FlightResultWrapper result2 = FlightController.addNewFlight(arrivalAirport.IATA__c, departureAirport.IATA__c);
        Test.stopTest();
        System.assertEquals(FlightController.FLIGHT_ALREADY_EXISTS, result2.message);
    }
}