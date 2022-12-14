import { LightningElement } from 'lwc';
import OBJECT_N from "@salesforce/schema/Airlines__c"
import NAME_F from "@salesforce/schema/Airlines__c.Name"
import COUNTRY_F from '@salesforce/schema/Airlines__c.Country__c'
import HEADQ_F from '@salesforce/schema/Airlines__c.Head_Quaters__c'
import SLOGAN_F from '@salesforce/schema/Airlines__c.Slogan__c'
import EST_F from '@salesforce/schema/Airlines__c.Established__c'
import { ShowToastEvent } from 'lightning/platformShowToastEvent'



export default class RecordEditFormAirlines extends LightningElement {

    recId = 'a0C4x000009PciFEAS';
    objApi = OBJECT_N;

    field = {
        name: NAME_F,
        country: COUNTRY_F,
        headq:HEADQ_F,
        slogan:SLOGAN_F,
        est:EST_F
    };

    successHandler(){
        const successEvent = new ShowToastEvent({
            title:'Success',
            message:'Updated',
            variant:'success'
        })

        this.dispatchEvent(successEvent);
    }
}