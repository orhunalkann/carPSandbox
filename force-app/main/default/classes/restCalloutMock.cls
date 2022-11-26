public with sharing class restCalloutMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request){
        if(request.getMethod() == 'GET' && request.getEndPoint() == 'https://th-apex-http-callout.herokuapp.com/animals'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        return response;
        }
        else if(request.getMethod() == 'GET' && request.getEndPoint() == 'https://mockyard.herokuapp.com/blogs'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            string jsonStr = '[{"id":1,"topic":"business","title":"Korean App Builder ProtoPie Raises $8 Million For North America Expansion","author":"Jayde Cheung","body":"ProtoPie, a Seoul-based startup that helps companies build websites and mobile apps, has raised $8 million in a funding round to fuel its global expansion. The funding round was led by leading Korean VC firm LB Investment, whose other investments include Kakao Games, online grocery startup Kurly and Goldman Sachs-backed proptech startup ZigBang. Existing investors HB Investment, Intops Investment and Korean mobile game company Devsisters also participated in the funding round. Korean billionaire Park Hyeon-joos Mirae Asset Venture Investment joined the round as a new investor."}]';
            response.setBody(jsonStr);
            return response;
        }
        else if(request.getMethod() == 'GET' && request.getEndPoint() == 'https://mockyard.herokuapp.com/products'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            string jsonStr = '[{"id":1,"name":"Pepper - Chilli Seeds Mild","image":"https://source.unsplash.com/random/900×700/?product,fruit,electronics,food,drink","price":"$260.82","description":"sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo","category":"Groceries","createdAt":"30-03-2021","productId":52434932138}]';
            response.setBody(jsonStr);
            return response;
        }
        else if(request.getMethod() == 'GET' && request.getEndPoint() == 'https://mockyard.herokuapp.com/users'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            string jsonStr = '[{"id":1,"name":"Hasty Skinn","email":"hskinn0@addtoany.com","gender":"Male","image":"https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80","phone":"708-484-6550","country":"Albania","city":"Krahës","age":41}]';
            response.setBody(jsonStr);
            return response;
        }
    return null;
    }
    
    
}