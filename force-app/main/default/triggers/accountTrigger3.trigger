trigger accountrigger on Account (before insert, before update, after insert, after update) {
    system.debug('---start---');
    if(Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert trigger.old ==> ' + trigger.old);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert trigger.old ==> ' + trigger.old);
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before insert trigger.old ==> ' + trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after insert trigger.old ==> ' + trigger.old);
    }



}