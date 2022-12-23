trigger AirlinesTrigger on Airlines__c (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert){
            AirlinesHandler.afterInsert(Trigger.new);
        }
    }
}

//   Whenever 'Airlines__c' record is created,  
// the Trigger ('AirlinesTrigger') call the handler method 'AirlinesHandler' with Trigger new
// Since we use POST call out, we use @future class and 
//because future class needs primitive data we do for loop to Airlines__c records and pass their Ids to AirlinesCallOuts class
// in 'AirlinesCallOuts' query to inserted record from UI. Wrapp and serialize to expected json format. set request.Headers,body,method,entpoint and http.send(request)
// get response and process the field 'Intigration Status' with response.body, status, reponse.getstatusCode();