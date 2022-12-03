public with sharing class AirlinesHandler {
    public static void afterInsert(List<Airlines__c> newAirlines){
        for(Airlines__c line : newAirlines){
            //call the future method by passing airline id
            AirlinesCallouts.postAirlinesDetails(line.Id);
        }
    }
}
