import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACC_OB from '@salesforce/schema/Account'

export default class GetObjectInfoAccount extends LightningElement {

    accRId;

    @wire(getObjectInfo, {objectApiName: ACC_OB})
    infoHandler({data, error}){
        if(data){
            console.log(data);
            this.accRId = data.defaultRecordTypeId;

        }
        if(error){
            console.log(error);
        }
    }
}