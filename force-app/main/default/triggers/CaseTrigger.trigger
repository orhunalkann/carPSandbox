trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    system.debug('We are in the triggers');
    if (trigger.isBefore) {
        system.debug('We are in the before triggers');
        if (trigger.isInsert) {
            system.debug('we are in the before-insert triggers ');
            caseTriggerHandler.newCaseCreation(Trigger.new);
    }   
        if (trigger.isUpdate) {
            system.debug('we are in the before update trigger');
            map<id, Case> caseOldRecsMap = trigger.oldMap;
            for (case c : Trigger.new){
                if (c.origin != caseOldRecsMap.get(c.id).origin) {
                    system.debug('c.origin is changed to ' + c.origin);
                }
            }
    }
    }
    if(trigger.isAfter){
        system.debug('we are in the after triggers');
        if (trigger.isInsert) {
            system.debug('we are in the after-Insert triggers');


        if (trigger.isUpdate) {
            system.debug('we are in the after-Update triggers');
        }
        }
    }
    for (Case c : trigger.new) {
        system.debug('Case # '+c.caseNumber+' with Id = '+c.Id+' Was Created on '+c.createdDate);
    }
}   

