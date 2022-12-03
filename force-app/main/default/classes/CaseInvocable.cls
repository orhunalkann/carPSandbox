public class CaseInvocable {
    @InvocableMethod(label='Send Email & Save Activity' 
                     description='Send an email and save the same under contact as activity.' 
                     category='Case')
    public static void sendEmailSaveActivity(list<RequestInputs> inputs){
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        //1. Iterate over list of inputs and prepare one email for each
        for(RequestInputs inp : inputs){
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setSubject('Case Created: '+ inp.caseNumber);
            msg.setPlainTextBody('Hi there, '
                                 + '\n A case has been created for your query. Please quote the case number when you call us next time. '
                                 + '\n\n Thanks,'
                                 + '\n Salesforce');
            msg.setTargetObjectId(inp.contactId);
            msg.setSaveAsActivity(true);
            msgs.add(msg);
        }
        
        //2. Send those emeails
        try {
            Messaging.sendEmail(msgs);
        }catch(Exception e){
            system.debug(e.getMessage());
        }
    }
    public class RequestInputs{
        @InvocableVariable(label='Case Number' description='Case Number' required='true')
        public String caseNumber;
        
        @InvocableVariable(label='Contact Id' description='Contact Id' required='true')
        Public Id contactId;
    }
}