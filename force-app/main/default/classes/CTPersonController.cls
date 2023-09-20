public with sharing class CTPersonController {
    public CTPersonController() {

    }

    public static String getToken(String mobileNo){
        if(mobileNo != null){
        Blob targetToken = Blob.valueOf(mobileNo);
        Blob token = Crypto.generateDigest('MD5', targetToken);
        return EncodingUtil.base64Encode(token);
             }
         return null;  
    }

    public static List<Person__c> getRecentHealthChanges(){
        List<Person__c> recentHealthChanges = [SELECT CreatedById, Health_Status__c,LastModifiedById, Mobile__c,Name,OwnerId,Status_Update_date__c,Token__c 
                                               FROM Person__c
                                               ORDER BY Status_Update_date__c DESC
                                               LIMIT 100];
        return recentHealthChanges;                                           

    }

    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm = searchTerm + '%';
        List<Person__c> srchPeople = [SELECT CreatedById, Health_Status__c,LastModifiedById, Mobile__c,Name,OwnerId,Status_Update_date__c,Token__c 
                                      FROM Person__c
                                      //WHERE (Name = :searchTerm)
                                      WHERE (Name LIKE 'searchTerm%') 
                                        OR (Mobile__c LIKE 'searchTerm%')
                                        OR (Token__c LIKE 'searchTerm%')
                                      ORDER BY Status_Update_date__c DESC
                                      LIMIT 100];
        return srchPeople; 
    }
    public static List<Person__c> getPersonById(String personId){
        List<Person__c> personById = [SELECT CreatedById, Health_Status__c,LastModifiedById, Mobile__c,Name,OwnerId,Status_Update_date__c,Token__c 
                                      FROM Person__c
                                      WHERE (id = :personId)
                                      ORDER BY Status_Update_date__c DESC
                                      LIMIT 100];
        return personById; 

    }

}