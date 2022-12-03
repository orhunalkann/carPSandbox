public with sharing class restPostCalloutMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request){
        if(request.getMethod() == 'POST' && request.getEndPoint() == 'https://th-apex-http-callout.herokuapp.com/animals'){
            HttpResponse response = new HttpResponse();
            response.setStatus('Created');
            response.setStatusCode(201);
            return response;
        }
        if(request.getMethod() == 'POST' && request.getEndPoint() == 'https://gorest.co.in/public/v2/users'){
            HttpResponse response = new HttpResponse();
            response.setStatus('Created');
            response.setStatusCode(201);
            return response;
        }
        return null;
    }
}