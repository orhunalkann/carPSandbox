public with sharing class SFProjectTriggerHandler {
    public static void createDefaultTicket(list<Salesforce_Project__c> spTriggerNew) {
        list<Salesforce_Ticket__c> spTicket = new list<Salesforce_Ticket__c>();
        DefaultTicketInfo__c dt = DefaultTicketInfo__c.getOrgDefaults();
        try{
            for(Salesforce_Project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = dt.Subject__c;
                st.Description__c = dt.Description__c;
                st.Salesforce_Project__c = eachSP.id;
                st.status__c = 'Testing';
                spTicket.add(st);
                st.Priority__c = 'Medium';
            }
            if (!spTicket.isEmpty()) {
                insert spTicket;
            }
        }catch(Exception e){
            system.debug('some error occurred here: ' + e);
            for(salesforce_project__c eachSP : spTriggerNew) {
                eachSP.addError('Some error in creating default ticket. Call your admin');
            }
        }
    }

    public static void validateProjectCompletion(list<Salesforce_Project__c> spTriggerNew, 
                                                    List<Salesforce_Project__c> spTriggerOld, 
                                                    map<id, Salesforce_Project__c> spTriggerNewMap, 
                                                    map<id, Salesforce_Project__c> spTriggerOldMap){
        
        //Get projects for which STATUS is CHANGED to 'Completed'
        
        //set of id of projects
        set<id> setProjectId = new Set<id>();
        
        for(Salesforce_Project__c sp : spTriggerNew){
            if(sp.status__c == 'Completed' && sp.status__c != spTriggerOldMap.get(sp.id).status__c){
                setProjectId.add(sp.id);
            }
        }//i just added to the set, which salesforce_project__c.status__c is changed to 'Completed'

        //Get all tickets of 'setProjectId' which are NOT completed
        // for fetch the salesforce_ticket__c, i'm going to use soql [WHERE Id in :setProjectId] and status is not 'Completed'
        list<Salesforce_Ticket__c> spTicket = [select id, status__c, Salesforce_Project__c from Salesforce_Ticket__c 
                                                    where Salesforce_Project__c in :setProjectId and status__c != 'Completed'];

        for(Salesforce_Ticket__c eachTicket : spTicket){
            Salesforce_Project__c sp = spTriggerNewMap.get(eachTicket.Salesforce_Project__c);
            sp.addError('Cannot completed project because all its tickets are not completed');
            
        }
    }//i got the tickets and i use triggerNewMap to get eachTicket's project for add error(validatio rule)

    //static
    //returns void
    //pass primitive dataype, collection of promitive dataype

    @future // ??????
    public static void updateDescripton(set<id> projectIds){
        system.debug('future method called');
        system.debug('inerted project ids==> ' + projectIds);
        //update description of all created project HERE.

        //soql to fetch project records
        list<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :projectIds];
        for(Salesforce_Project__c sp : listSP){
            sp.description__c += 'Updated from future';
        }
        update listSP;

    }

    public static void spComplatedStatus (list<Salesforce_Project__c> spTriggerNew, 
                                        list<Salesforce_Project__c> spTriggerOld, 
                                        map<id,Salesforce_Project__c> spTriggerNewMap, 
                                        map<id,Salesforce_Project__c> spTriggerOldMap){

        set<id> spIds = new Set<id>();
        for(Salesforce_Project__c spNew : spTriggerNew){
            Salesforce_Project__c spOld = spTriggerOldMap.get(spNew.Id);
            if(spNew.status__c == 'Completed' && spOld.status__c != 'Completed'){
                spIds.add(spNew.Id);
            }
        }
        system.debug('sp ids status complated ==> ' + spIds);
        if(!spIds.isEmpty()){
        updateTicketStatus(spIds);
        }
    }
    @future
    private static void updateTicketStatus(set<id> spIds){
        list<Salesforce_Ticket__c> spTicket = [select id, status__c from Salesforce_Ticket__c where Salesforce_Project__c in :spIds and status__c != 'Completed'];
        for (Salesforce_Ticket__c st: spTicket){
            st.status__c = 'Completed';
        }
        update spTicket;
    }

}