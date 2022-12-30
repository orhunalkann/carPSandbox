public with sharing class resPostCallOutDeneme {
    public static HttpResponse callOut() {
        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        

        Airlines__c airOb = [SELECT Id, Name, Country__c, Logo_URL__c, Slogan__c, Head_Quaters__c, Website__c, Established__c
                                    FROM Airlines__c
                                    LIMIT 1];

        //list<gorestContactWrapper> wrappers = new list<gorestContactWrapper>();
        
        airlinewrap wrapO = new airlinewrap();
        wrapO.name = airOb.Name;
        wrapO.country = airOb.Country__c;
        wrapO.logo = airOb.Logo_URL__c;
        wrapO.slogan = airOb.Slogan__c;
        wrapO.head_quaters = airOb.Head_Quaters__c;
        wrapO.website = airOb.Website__c;
        wrapO.established = airOb.Established__c;

        request.setBody(JSON.serialize(wrapO));
        request.setMethod('POST');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            system.debug('Airline posted');
        }else{
            system.debug(response.getStatusCode());
            system.debug(response.getBody());
        }
        return response;


    }
}
