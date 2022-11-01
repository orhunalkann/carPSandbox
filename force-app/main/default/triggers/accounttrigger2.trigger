trigger accounttrigger2 on SOBJECT (before insert, before update) {
    system.debug('---start---');
    if(trigger.isInsert){
        system.debug('account before insert trigger called');
    }
    if(trigger.isUpdate){
        system.debug('account before update trigger called');

    }
    system.debug('---end---');
}