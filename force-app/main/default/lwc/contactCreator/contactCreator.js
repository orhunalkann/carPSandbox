import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import FNAME_F from '@salesforce/schema/Contact.FirstName';
import LNAME_F from '@salesforce/schema/Contact.LastName';
import EMAIL_F from '@salesforce/schema/Contact.Email';
import CONT_OB from '@salesforce/schema/Contact';
export default class ContactCreator extends LightningElement {

    objectNam = CONT_OB;
    fields = [FNAME_F, LNAME_F, EMAIL_F];
    handleSuccess(event){
        const toasEv = new ShowToastEvent({
            title:'Contact created',
            message:'Record Id: ' + event.detail.id,
            variant:'Success'
        });
        this.dispatchEvent(toasEv);
    }
}