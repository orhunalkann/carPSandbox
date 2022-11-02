trigger accounttrigger on account (before insert, before update, after insert, after update, before delete) {
    
    //check if switch is ON or OFF
    TriggerSwitch__c switchq = TriggerSwitch__c.getInstance('account');
    boolean isOn = switchq.switch__c; // checkbox field
    if (isOn == false){
        return;
    }
    //if OFF
        //return
    
    
    
    
    //system.debug(Trigger.operationType +'ilk satir');
    //system.debug('---start---');
    
    /*
    
    if(Trigger.isBefore){
        system.debug('BEFORE Trigger - insert or update');
        if(trigger.isInsert){
            system.debug('account before insert trigger called');
        }
        if(Trigger.isUpdate){
            system.debug('account update trigger called');
            system.debug('before trigger.new==> ' + trigger.new);
        }
    }
    if(Trigger.isAfter){
        system.debug('AFTER Trigger - insert or update');
        if(trigger.isInsert){
            system.debug('account after insert trigger called');
        }
        if(Trigger.isUpdate){
            system.debug('account update trigger called');
        }
    }

    
    system.debug('---end---');
    


    

    list<account> updatedAccounts = trigger.new;
    if(trigger.isAfter){
        system.debug('after trigger.new==> ' + updatedAccounts);
        system.debug('number of updated accounts is ' + updatedAccounts.size());
        for(account eachAcc : updatedAccounts){
            system.debug('updateded accounts id is ' + eachAcc.id);
        }
    }
*/

/*
    system.debug('---start---');

    if(trigger.isAfter && trigger.isUpdate){
        list<account> newAcc = trigger.new;
        set<Id> setAccID = new set<Id>();
        for (account eachAcc : newAcc){
            system.debug('NEW account id is ' + eachAcc.id);
            setAccID.add(eachAcc.id);
        }
        system.debug('set of ids ==> ' + setAccID);
        list<account> oldAcc = trigger.old;
        for (account eachAcc : oldAcc){
            system.debug('OLD account id is ' + eachAcc.id);
        }
    }

    system.debug('---end---');

    */

    /*map<id, account> newAccMap = trigger.newMap;
    map<id, account> oldAccMap = trigger.oldMap;

    system.debug('---start---');
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('before insert old map ==> ' + oldAccMap);
        system.debug('before insert new map ==> ' + newAccMap);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('after insert old map ==> ' + oldAccMap);
        system.debug('after insert new map ==> ' + newAccMap);
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('before update old map ==> ' + oldAccMap);
        system.debug('before update new map ==> ' + newAccMap);
        for (id eachAcc : newAccMap.keySet()){
            system.debug('keysets ==> ' + eachAcc);
            account newAccount = newAccMap.get(eachAcc);
            system.debug('update account ==> ' + newAccount);
        }
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('after update old map ==> ' + oldAccMap);
        system.debug('after update new map ==> ' + newAccMap);
    }

    system.debug('---end---');

    */

    //map<id, account> newAccMap = trigger.newMap;
    //map<id, account> oldAccMap = trigger.oldMap;


    /*system.debug('---start---');

    if(trigger.isBefore && trigger.isUpdate){
        set<Id> setAccID = newAccMap.keySet();
        integer counterForUpdatedEmail = 0;
        for(id eachid : setAccID){
            account oldAccount = oldAccMap.get(eachid);
            //system.debug('old account ==> ' + oldAccount);
            string oldAccWeb = oldAccount.website;
            //system.debug('old account website ==> ' + oldAccWeb);

            account newAccount = newAccMap.get(eachid);
            //system.debug('new account ==> ' + newAccount);
            string newAccountWeb = newAccount.website;
            //system.debug('new account website ==> ' + newAccountWeb);


            if(oldAccWeb != newAccountWeb){
                counterForUpdatedEmail ++;
                system.debug('For account ' + newAccount.name + 'website is changed to ' + newAccount.website);
            }
        }
        system.debug('# of account website updated ' + counterForUpdatedEmail);
    }
    */

    /*system.debug('---start---');

    if (Trigger.isBefore){
        list<account> newAccounts = trigger.new;
        system.debug(Trigger.operationType);
        for (account eachAccount : newAccounts){
            boolean accActivea = false;

            if(Trigger.isInsert && eachAccount.Active__c == 'Yes'){
                accActivea = true;
                
            }
            if (Trigger.isUpdate){
                account oldAccount = trigger.oldMap.get(eachAccount.id);
                account newAccount = trigger.newMap.get(eachAccount.id);

                if(eachAccount.Active__c == 'Yes' && oldAccount != newAccount){
                    accActivea = true;
                    system.debug(Trigger.size);
                }
                if(eachAccount.Phone == null){
                    eachAccount.addError('Phone number is required');
                }
                if(accActivea == true){
                    eachAccount.Description = 'Account is now active. Enjoy Bud!';

                }
            }
        }
        system.debug('---end---');
        system.debug(Trigger.size);
    }
    */

    
    //system.debug('---start---');
    if (Trigger.isBefore) {
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    

    
    if(Trigger.isAfter && Trigger.isUpdate) {
        accountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        
    }
    /*
    system.debug('---end---');

    if(Trigger.isBefore && Trigger.isUpdate) {
        AccountHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    */
}