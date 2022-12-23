import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';

import ACCNAME_F from '@salesforce/schema/Account.Name';
import TYPE_F from '@salesforce/schema/Account.Type';
import IND_F from '@salesforce/schema/Account.Industry';
import VIP_F from '@salesforce/schema/Account.VIP__c';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const fiel = [ACCNAME_F, TYPE_F, IND_F, VIP_F];
export default class UpdateRecordAccountAssignment extends LightningElement {
    recI='0014x00001lWcV2AAK';
    typeValues=[];
    indValues=[];
    @track updateData={};

    @wire(getRecord,{
        fields:fiel,
        recordId:'$recI'
    })accRec;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accInfo;
    

    
    @wire(getPicklistValuesByRecordType,{
        objectApiName:ACCOUNT_OBJECT,
        recordTypeId:'$accInfo.data.defaultRecordTypeId'
    })typeHandler({data,error}){
        if(data){
            console.log(data);
            this.typeValues = data.picklistFieldValues.Type.values
            this.indValues = data.picklistFieldValues.Industry.values
        }
        if(error){
            console.log(error);
        }
    }

    

    

    changeHandler(event){
        if(event.target.label === 'VIP ?'){
            const {name, checked} = event.target;
            this.updateData[name] = checked;
        }else{
            const {name,value} = event.target;
            this.updateData[name] = value;
        }
    }


    saveHandler(){
        this.updateData['Id'] = this.recI;
        const recordInput = {
            fields:this.updateData
        };

        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                this.dispalyToast('Success', 'Record updated', 'success');
            })
            .catch(error => {
                console.log(error);
            })
    }

    dispalyToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}