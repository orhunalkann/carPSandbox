public with sharing class AirlinesCallouts {
    
    @future(callout=true)
    public static void postAirlinesDetails(Id airlinesId){
        //prepare data
        Airlines__c line = [SELECT Name, Country__c, Logo_URL__c, Slogan__c, Head_Quaters__c, Website__c, Established__c
                            FROM Airlines__c 
                            WHERE Id = :airlinesId];
        AirlinesWrapper wrap = new AirlinesWrapper();
        wrap.name = line.name;
        wrap.country = line.Country__c;
        wrap.logo = line.Logo_URL__c;
        wrap.slogan = line.Slogan__c;
        wrap.head_quaters = line.Head_Quaters__c;
        wrap.website = line.Website__c;
        wrap.established = line.Established__c;
        String body = JSON.serialize(wrap);
        //1. prepare http request and wrap all necessary data in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        system.debug(body);
        //2. prepare Internet
        Http http = new Http();
        //3. send the request over the internet to receive response back
        HttpResponse response = http.send(request);
        //4. process the response
        system.debug(response.getBody());
        line.Integration_Status__c = Datetime.now()
            + ' ' + response.getStatusCode()
            + ' ' + response.getStatus()
            + ' ' + response.getBody();
        try {
            update line;
        } catch(Exception ex) {
            //create a log
        }
    }
}
