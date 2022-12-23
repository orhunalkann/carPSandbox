import { LightningElement } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Case.AccountId'
import CONTACT_NAME from '@salesforce/schema/Case.ContactId'
import SUBJECT from '@salesforce/schema/Case.Subject'
import DESC from '@salesforce/schema/Case.Description'
import PRIORITY from '@salesforce/schema/Case.Priority'
import TYPE from '@salesforce/schema/Case.Type'
import CASEOBJ from '@salesforce/schema/Case'
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class RecordFromCase extends LightningElement {

    fields = [ACCOUNT_NAME, CONTACT_NAME, SUBJECT, DESC, PRIORITY, TYPE];
    objectNam = CASEOBJ;
    caseId = '5004x00000PCzC7AAL';
    successHandler(){
        //toast message
        //import { ShowToastEvent } from 'lightning/platformShowToastEvent';
        
        const successEvent = new ShowToastEvent({
            title:'Success',
            message:'Case record has been saved',
            variant:'success',
            mode:'sticky'
        });
        
        this.dispatchEvent(successEvent);
    }
}