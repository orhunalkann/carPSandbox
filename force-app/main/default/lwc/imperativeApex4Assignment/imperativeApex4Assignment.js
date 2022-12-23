import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACC_OBJ from '@salesforce/schema/Account';
import IND_F from '@salesforce/schema/Account.Industry';
import getAccs from '@salesforce/apex/accountCtrlAssignmet4.getAccs';

export default class ImperativeApex4Assignment extends LightningElement {

    indValues=[];
    accs;

    @wire(getObjectInfo, {objectApiName:ACC_OBJ})acco;

    @wire(getPicklistValues,{fieldApiName:IND_F, recordTypeId:'$acco.data.defaultRecordTypeId'})
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.indValues = data.values;
        }
        if(error){
            console.log(error);
        }
    }

    changeHandler(event){
        const selectedValue = event.target.value;
        getAccs({searchKey:selectedValue})
            .then(result => {
                this.accs = result;
            })
            .catch(error => {
                console.error(error);
            })
    }
}