import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONT_OBJ from '@salesforce/schema/Contact'

export default class GetObjectInfoContact extends LightningElement {

    contRecId;

    @wire(getObjectInfo, {objectApiName: CONT_OBJ})
    hendlerF({data, error}){
        if(data){
            console.log(data);
            this.contRecId=data.defaultRecordTypeId;
            
        }
        if(error){
            console.log(error);
        }
    }
    
}