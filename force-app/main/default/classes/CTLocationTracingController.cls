public with sharing class CTLocationTracingController {
    public CTLocationTracingController() {

    }

    public static List<Location_Tracing__c> getVisitors (String locationId){
        List<Location_Tracing__c> visitor =[SELECT Id, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Person__c, Location__c, Visit_Date__c 
                                            FROM Location_Tracing__c
                                            WHERE Id = :locationId
                                            ORDER BY Visit_Date__c DESC];
        return visitor;                                            

    }

    public static List<Location_Tracing__c> getLocationsByPersonIds (Set<Id> personIds){
        List<Location_Tracing__c> locationByPersonsId = new List<Location_Tracing__c> ();
        for(Id personId: personIds){
            locationByPersonsId = [SELECT Id, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Person__c, Location__c, Visit_Date__c 
                                   FROM Location_Tracing__c
                                   WHERE Person__c = :personId
                                   AND Visit_Date__c = LAST_N_DAYS:10];
        }
        return locationByPersonsId;
    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        List<Location_Tracing__c> locationsByLocationIds = new List<Location_Tracing__c> ();
        for(Id locationId: locationIds){
            locationsByLocationIds = [SELECT Id, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Person__c, Location__c, Visit_Date__c 
                                      FROM Location_Tracing__c
                                      WHERE Location__c = :locationId];
        }
        return locationsByLocationIds;
    }
}