public with sharing class CaseTriggerHandler {
    public static void newCaseCreation(List<Case> triggerNew) {
        for (Case cs : triggerNew) {
            if (cs.Origin=='Email') {
                cs.Status='New';
                cs.Priority='Medium';
            }
        }
    }
}