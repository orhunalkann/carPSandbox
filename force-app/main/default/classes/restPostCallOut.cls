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




}
