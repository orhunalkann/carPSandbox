trigger OpportunityTrigger on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        map<id, Opportunity> oppOldRecsMap = Trigger.oldMap;
        for (Opportunity opp : Trigger.new) {
            system.debug('new opp name'  + opp.name);
            system.debug('old opp name' + oppOldRecsMap.get(opp.id).name);
            system.debug('new opp name' + opp.amount);
            system.debug('old opp name' + oppOldRecsMap.get(opp.id).amount);
            
            if(oppOldRecsMap.get(opp.id).stageName != opp.stageName){
                system.debug('opp name ==> ' + opp.name);
                system.debug('opp description ==> ' + opp.description);
            }
            
        }
        
    }
}