public class contactTriggerHandler {
    /*public static void contactValidation1( List<contact> conTriggerNew, 
                                        List<contact> conTriggerOld,
                                        Map<id, contact> conTriggerNewMap, 
                                        map<id, contact> conTriggerOldMap) {


        /*
        
        for(contact eachContact : conTriggerNew){
            //check if existing LEADSORUCE is Partner Referal.
            //old contact record?
            contact oldContact = conTriggerOldMap.get(eachContact.id);
            if(oldContact.LeadSource == 'Partner Referral'){
                eachContact.addError('Cannot update \'Partner Referal\' contacts.');
            }
        }
    }
*/
    public static void contactValidation2( List<contact> conTriggerNew, 
                                        List<contact> conTriggerOld,
                                        Map<id, contact> conTriggerNewMap, 
                                        map<id, contact> conTriggerOldMap){
        for(Contact eachContact : conTriggerNew){
            if(eachContact.LeadSource != conTriggerOldMap.get(eachContact.id).LeadSource){
                
                // how to fetch custom label text on apex?
                string customMessage = system.label.contactValidation2;
                eachContact.LeadSource.addError(customMessage);
        }
    
    }
}

}