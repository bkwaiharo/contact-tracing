public with sharing class CTLocationController {
    public CTLocationController() {

    }
    
    public static List<Location__c> getRecentStatusChanges(){
        List<Location__c> recentStatusChanges = Database.query('SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c' 
                                                                +'FROM Location__c'
                                                                +'ORDER BY Status_Update_Date__c DESC LIMIT 100');
        return recentStatusChanges;
    }

    public static List<Location__c> searchLocations(String searchTerm){
        List<Location__c> searchLoc = Database.query('SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c' 
                                                    +'FROM Location__c'
                                                    +'WHERE Name LIKE \'searchTerm%\' OR Mobile__c LIKE \'searchTerm%\' OR Token__c LIKE \'searchTerm%\''
                                                    +'ORDER BY Status_Update_Date__c DESC');
        return searchLoc;
    }

    public static Location__c getLocationById (String locationId){
        Location__c location = [SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c
                                 FROM Location__c
                                 WHERE Id = :locationId
                                LIMIT 1 ];
        return location;
    }
}