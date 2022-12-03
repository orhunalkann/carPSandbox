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
            request.setEndpoint('https://gorest.co.in/public/v2/users');


            Gorest_Contact__c cont = [SELECT Id, Name, Gender__c, Email__c, Status__c FROM Gorest_Contact__c LIMIT 1];
            //list<gorestContactWrapper> wrappers = new list<gorestContactWrapper>();
            //for(Gorest_Contact__c cont : conts){
                gorestContactWrapper wrap = new gorestContactWrapper();
                wrap.name = cont.name;
                wrap.gender = cont.gender__c;
                wrap.email = cont.email__c;
                wrap.status = cont.status__c;
                //wrappers.add(wrap);z
            //}
            
            
            
            request.setBody(JSON.serialize(wrap));
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Authorization', 'Bearer 903f4737f34e2394bd93c99b5fa2905071676f38d7f82ee6438c9f38b714c8eb');


            Http http = new Http(); 
            HttpResponse response = http.send(request);

            if(response.getStatusCode()== 201){
                system.debug('goRest object POSTED');
            }else{
                system.debug('Something went wrong '+ response.getStatusCode());
                system.debug(response.getBody());
            }
            return response;
        }

        // access token = 903f4737f34e2394bd93c99b5fa2905071676f38d7f82ee6438c9f38b714c8eb

        //https://gorest.co.in//public/v2/users

		public static HttpResponse deleteUser(){
            HttpRequest request = new HttpRequest();
            request.setMethod('DELETE');
            request.setEndpoint('https://gorest.co.in/public/v2/users/190');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Authorization', 'Bearer 903f4737f34e2394bd93c99b5fa2905071676f38d7f82ee6438c9f38b714c8eb');
            
            Http http = new Http();
            HttpResponse response = http.send(request);
            
            system.debug(response.getStatus());
            system.debug(response.getStatusCode());
            if(response.getStatusCode() == 204){
                system.debug('Record deleted');
            }
            return response;
        }
}