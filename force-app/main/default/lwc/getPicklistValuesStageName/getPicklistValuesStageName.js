import { LightningElement, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACC_OBJ from '@salesforce/schema/Account'
import TYPE_F from '@salesforce/schema/Account.Type'

export default class GetPicklistValuesStageName extends LightningElement {

    rTyId;
    selectedV=[];

    @wire(getObjectInfo,{objectApiName:ACC_OBJ})
    infoHandler({data,error}){
        if(data){
            console.log(data)
            this.rTyId = data.defaultRecordTypeId;
        }
        if(error){{
            console.error(error)
        }
    }
    }
    @wire(getPicklistValues, {fieldApiName:TYPE_F, recordTypeId:'$rTyId'})
    dataHandler({data, error}){
        if(data){
            console.log(data);
            this.selectedV = data.values;

        }
        if(error){
            console.error(error);
        }
    }
    visib;
    changeHandler(event){
        this.visib = event.target.value;
    }
}