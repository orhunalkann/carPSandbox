trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
    SFProjectTriggerHandler.createDefaultTicket(Trigger.New);

    system.debug('calling future method...');
    SFProjectTriggerHandler.updateDescripton(Trigger.newMap.keyset());
    system.debug('DONE calling future method');
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        SFProjectTriggerHandler.spComplatedStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}