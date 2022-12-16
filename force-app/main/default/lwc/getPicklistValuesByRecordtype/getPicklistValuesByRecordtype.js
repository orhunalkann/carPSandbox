import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import ACC_OB from '@salesforce/schema/Account'

export default class GetPicklistValuesByRecordtype extends LightningElement {
    
    recTyId;

    industryOpt=[];
    typeOpt=[];

    @wire(getObjectInfo, {objectApiName:ACC_OB})
    infoHan({data, error}){
        if(data){
            console.log(data);
            this.recTyId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }
    @wire(getPicklistValuesByRecordType,
        {objectApiName:ACC_OB, 
            recordTypeId:'$recTyId'})
    
            accHan({data, error}){
            if(data){
                console.log(data);
                this.industryOpt = data.picklistFieldValues.Industry.values;
                this.typeOpt = data.picklistFieldValues.Type.values;

            }
            if(error){
                console.error(error);
            }
    }
    visibT;
    visibI;
    changeHandler(event){
        this.visibT = event.target.value;
    }changeHandler2(event){
        this.visibI = event.target.value;
    }
}