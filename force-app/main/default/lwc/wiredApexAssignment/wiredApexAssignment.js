import getChildCntc from '@salesforce/apex/contactCtrl.getChildCntc';
import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import ACC_NAME_F from '@salesforce/schema/Account.Name';

const fiel = [ACC_NAME_F];
export default class WiredApexAssignment extends LightningElement {
    
    accountId='0014x00001M1QHgAAN';
    secaccId;
    @wire(getChildCntc, {accId:'$secaccId'})contacts;
    
    

    @wire(getRecord, {recordId:'$secaccId', fields:fiel})
    accHandler({data,error}){
        if(data){
            console.log(data);
        }  
        if(error){
            console.error(error);
        }
    }   


    changeHandler(event){
        this.secaccId = event.target.value;
    }

    clickHandler(){
        
        
    }
}