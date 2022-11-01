trigger contactTrigger on Contact (before insert, after insert, before update, after update) {
if(Trigger.isUpdate && Trigger.isBefore){
    contactTriggerHandler.contactValidation2(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
}
}