import { LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_OBJ from '@salesforce/schema/Account';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormAccount extends LightningElement {
    fields = [NAME_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, TYPE];
    objectNam = ACCOUNT_OBJ;
    accId = '0014x00001PwBZCAA3';
    
    successHandler(){
        //toast message
        //import { ShowToastEvent } from 'lightning/platformShowToastEvent';
        
        const successEvent = new ShowToastEvent({
            title:'Success',
            message:'Account record has been saved',
            variant:'success',
            mode:'sticky'
        });
        //dispatchEvent 
        //this ==> this component
        this.dispatchEvent(successEvent);
    }

    /*errorHandler(){
        const ErrorEvent = new ShowToastEvent({
            title:'Error !!',
            message:'Account record has NOT been saved',
            variant:'error'
        })
        this.dispatchEvent(errorEvent);
    }*/
}