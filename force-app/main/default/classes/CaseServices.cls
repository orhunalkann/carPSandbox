//HttpGet Web Service to External Services

@RestResource(urlMapping='/Case/*')
global with sharing class CaseServices {
    //qwes-dev-ed.develop.my.salesforce.com/services/apexrest/case/*
    //https://qwes-dev-ed.develop.my.salesforce.com/services/apexrest/case/5004x00000PAR23AAH

    @HttpGet
    global static Case getCase(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        String caseId = uri.substringAfterLast('/');
        Case cs = [SELECT Id, Priority, Origin, Subject, Description FROM Case WHERE Id = :caseId];
        return cs;
    }


    @HttpPost
    global static Id postCase(String Priority, String Origin, String Subject, String Description, string Status){
        Case cs = new Case();
        cs.Priority = Priority;
        cs.Origin = Origin;
        cs.Subject = Subject;
        cs.Description = Description;
        cs.status = Status;

        insert cs;
        return cs.id;
    }
    /*
    @HttpPost
    global static list<case> postCases(){

        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        list<case> readylist = (list<case>)JSON.deserialize(jsonString, list<case>.class);

        insert readylist;
        return readylist;
        
    }
*/
    @HttpDelete
    global static string deleteCase(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        String caseId = uri.substringAfterLast('/');
        Case cs = [SELECT Id FROM Case where Id =:caseId];
        delete cs;
        return 'Deleted';
    }

    @HttpPut
    global static Id putCase(String Id, String Priority, String Origin, String Subject, String Description, string Status){
        Case cs = new Case();
        cs.id = Id;
        cs.Priority = Priority;
        cs.Origin = Origin;
        cs.Subject = Subject;
        cs.Description = Description;
        cs.status = Status;
        upsert cs;
        return cs.Id;
    }
    @HttpPatch
    global static Case patchCase(){
        RestRequest request = RestContext.request;
        String jsonStr = request.requestBody.toString();
        
        //Approach #1
        Case cs = (Case)JSON.deserialize(jsonStr, Case.class);
        update cs;
        Case csObj = [SELECT Id, CaseNumber, Priority, Origin, Subject, Description FROM Case WHERE Id = :cs.Id];
        return csObj;

        
    }






}
/*    ANOTHER METHOD TO TAKE ID FROM LINK
//split()
String str = 'boo:moo:voo';
str.split(':'); ['boo', 'moo', 'voo'];

String uri = 'https://sf10-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Case/5005h00000ZY3jcAAD';
String[] words = uri.split('/');
[
    'https:',
    '',
    'sf10-dev-ed.trailblaze.my.salesforce.com',
    'services',
    'apexrest',
    'Case',
    '5005h00000ZY3jcAAD'
]

*/








