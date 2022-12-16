import { LightningElement, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';


import OBJ_API from '@salesforce/schema/Account'
import INS_F from '@salesforce/schema/Account.Industry'

export default class GetPicklistValuesIndustry extends LightningElement {

    accountRtId;
    industryOption = [];

    visibleV;

    

    @wire(getObjectInfo, {objectApiName: OBJ_API})
    infoHandler({data,error}){
        if(data){
            console.log(data);
            this.accountRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }
    @wire(getPicklistValues, {fieldApiName: INS_F, recordTypeId: '$accountRtId'})
    picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOption=data.values;
            
        }
        if(error){
            console.error(error);
        }
    }
        changeHandler(event){
            this.visibleV = event.target.value;
            
        }
    
}