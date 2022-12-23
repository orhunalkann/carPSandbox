import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJ from '@salesforce/schema/Opportunity'
export default class GetPicklistValuesbyRecordIdOpp extends LightningElement {

    recTypeId;
    stageOpt=[];
    typeOpt=[];
    
    stageV;
    typeV;
    
    changeHandler(event){
        if(event.target.label == 'STAGE'){
            this.stageV = event.target.value;
        }else{
            this.typeV = event.target.value;
        }
    }

    @wire(getObjectInfo,
        {objectApiName: OPP_OBJ})
        infoHandler({data, error}){
            if(data){
                this.recTypeId = data.defaultRecordTypeId;
            }
            if(error){
                console.error(error)
            }
        }
    @wire(getPicklistValuesByRecordType,
        {objectApiName: OPP_OBJ,
        recordTypeId:'$recTypeId'})
        dataHandler({data, error}){
            if(data){
                console.log(data);
                this.typeOpt = data.picklistFieldValues.Type.values;
                this.stageOpt = data.picklistFieldValues.StageName.values;
            }
            if(error){
                console.error(error); 
            }
        }
    
}