public with sharing class FlightController {
   
    @TestVisible
    private static String ARRIVAL_AIRPORT_NOT_FOUND ='Oops, the following error has ocurred - No arrival airport with the matching IATA code has been found.';
    @TestVisible
    private static String DEPARTURE_AIRPORT_NOT_FOUND ='Oops, the following error has ocurred - No departure airport with the matching IATA code has been found';
    @TestVisible
    private static String NO_AIRPORTS_FOUND = 'Oops, the following error has ocurred - No airports with the matching IATA codes have been found';
    @TestVisible
    private static String EXCEPTION_ERROR = 'Oops. There seems to be a problem. Please contact your Salesforce admin.';
    @TestVisible
    private static String FLIGHT_INSERT_SUCCESSFUL = 'You have successfully inserted the following flight';
    @TestVisible
    private static String FLIGHT_ALREADY_EXISTS = 'Oops. The flight you are trying to insert already exists.';

    @AuraEnabled
    public static FlightResultWrapper addNewFlight(String arrivalAirportIATA, String departureAirportIATA)
    {
        List<Airport__c> foundAirportsByIATA = [SELECT ID, Name,  IATA__c, Location__latitude__s, Location__longitude__s  FROM Airport__c WHERE IATA__c IN (:arrivalAirportIATA, :departureAirportIATA) LIMIT 2];
        FlightResultWrapper resultWrapper = new FlightResultWrapper();
        
        checkFetchedAirportData(foundAirportsByIATA, arrivalAirportIATA, departureAirportIATA, resultWrapper);
        
        if(String.isBlank(resultWrapper.message))
            createFlightRelation(foundAirportsByIATA, arrivalAirportIATA, resultWrapper);

            return resultWrapper;
    }

  public static void checkFetchedAirportData(List<Airport__c> fetchedAirports, String arrivalAirportIATA, String departureAirportIATA, FlightResultWrapper resultWrapper)
    {
        
        if(fetchedAirports.isEmpty())
        {
            resultWrapper.message = NO_AIRPORTS_FOUND;
            return;
        }
            
        if(fetchedAirports.size()!=2)
        {
            String errorMessageWhenOneIsNotFound =  fetchedAirports[0].IATA__c == arrivalAirportIATA ?  DEPARTURE_AIRPORT_NOT_FOUND :  ARRIVAL_AIRPORT_NOT_FOUND;
            resultWrapper.message = errorMessageWhenOneIsNotFound;
            return;

        }
        
        List<Flight__c> existingFlight = [SELECT ID, IATA_Departure_Airport__c FROM Flight__c WHERE IATA_Departure_Airport__c =:departureAirportIATA AND IATA_Arrival_Airport__c=:arrivalAirportIATA LIMIT 1];
       
        if(!existingFlight.isEmpty())
            {
                
                resultWrapper.message = FLIGHT_ALREADY_EXISTS;
                return;
            }
    }

    public static void createFlightRelation(List<Airport__c> airports, String arrivalAirportIATA, FlightResultWrapper resultWrapper)
    {
        Flight__c newFlight = new Flight__c();

        if(airports[0].IATA__C == arrivalAirportIATA)
        {
            newFlight.Arrival_Airport__c = airports[0].Id;
            newFlight.Departure_Airport__c = airports[1].Id;
            
            resultWrapper.arrivalAirportName = airports[0].Name;
            resultWrapper.departureAirportName = airports[1].Name;

        }
        else {
            newFlight.Arrival_Airport__c = airports[1].Id;
            newFlight.Departure_Airport__c = airports[0].Id;

            resultWrapper.arrivalAirportName = airports[1].Name;
            resultWrapper.departureAirportName = airports[0].Name;
        }

        Decimal distanceInKM = calculateDistance(airports[0].Location__latitude__s, airports[0].Location__longitude__s,
                                                airports[1].Location__latitude__s, airports[1].Location__longitude__s);
        
        newFlight.Flight_Distance__c = distanceInKM;
        resultWrapper.departureDistance = distanceInKM;
        
        try{
            insert newFlight;
            resultWrapper.message = FLIGHT_INSERT_SUCCESSFUL;
        }
        catch (Exception error)
        {
            System.debug(error.getMessage());
           
            // We should ideally log the error in the system here so that it can be checked at a later point in time.
            // Multiple ways to do that, depending on the implemented Logger structure.
           resultWrapper.message = EXCEPTION_ERROR;
        }
        
        
    //   return JSON.serialize(resultWrapper);
    }

    public static Decimal calculateDistance(Decimal latitude1, Decimal longitude1, Decimal latitude2, Decimal longitude2) {
        Integer earthRadius = 6371 * 1000; // in meters
        // Transform coordinates from degrees to radians
        Decimal latitudeRadians1 = latitude1 * Math.PI/180;
        Decimal latitudeRadians2 = latitude2 * Math.PI/180;
        // Latitude and longitude differences in radians
        Decimal latitudeDelta = (latitude2 - latitude1) * Math.PI/180;
        Decimal longitudeDelta = (longitude2 - longitude1) * Math.PI/180;
        Decimal a = Math.sin(latitudeDelta/2) * Math.sin(latitudeDelta/2) +
        Math.cos(latitudeRadians1) * Math.cos(latitudeRadians2) *
        Math.sin(longitudeDelta/2) * Math.sin(longitudeDelta/2);
        Decimal arc = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        Decimal distance = earthRadius * arc; // in metres
        return distance/1000; // we need kilometers
    }

    public class FlightResultWrapper
    {
        public FlightResultWrapper()
        {

        }
        @AuraEnabled
        public String message;
        @AuraEnabled
        public String arrivalAirportName;
        @AuraEnabled
        public String departureAirportName;
        @AuraEnabled
       public Decimal departureDistance;
    }
}