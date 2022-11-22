public with sharing class restPostCallOut {
    public static HttpResponse postAnimal(){
        // prepare htpprequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        string jsonString = '{"name" : "dog"}';
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json');

        //prepare the interner
        http http = new Http();

        //send the request over the internet to receive the response
        httpResponse response = http.send(request);

        // process the response
        if(response.getStatusCode() == 201){
            system.debug('Animal posted');
        }
        return response;
    }

        // prepare htpprequest and wrap the necessary information in it
        //prepare the interner
        //send the request over the internet to receive the response
        // process the response
        
        public static HttpResponse postGoRestObj(){
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://gorest.co.in/public/v2/users?access-token=903f4737f34e2394bd93c99b5fa2905071676f38d7f82ee6438c9f38b714c8eb');


            list<Gorest_Contact__c> conts = [SELECT Id, Name, Gender__c, Email__c, Status__c FROM Gorest_Contact__c LIMIT 100];
            String ready = JSON.serialize(conts);
            request.setBody(ready);
            request.setHeader('Content-Type', 'application/json');


            Http http = new Http(); 
            HttpResponse response = http.send(request);

            if(response.getStatusCode()== 200){
                system.debug('goRest object POSTED');
            }else{
                system.debug('Something went wrong '+ response.getStatusCode());
            }
            return response;
        }

        // access token = 903f4737f34e2394bd93c99b5fa2905071676f38d7f82ee6438c9f38b714c8eb

//https://gorest.co.in//public/v2/users



}
