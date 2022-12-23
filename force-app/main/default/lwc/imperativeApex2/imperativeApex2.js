import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_O from '@salesforce/schema/Opportunity'
import STAGE_F from '@salesforce/schema/Opportunity.StageName'
import getMatchingOpps from '@salesforce/apex/opportunityCtrl.getMatchingOpps';

const COLOUMS = [
    {label:'Opp Name', fieldName:'Name', type:'text'},
    {label:'Type', fieldName:'Type', type:'text'},
    {label:'Stage', fieldName:'StageName', type:'text'},
    {label:'Amount', fieldName:'Amount', type:'currency'},
]
export default class ImperativeApex2 extends LightningElement {

    stageOps=[];
    opps;
    error;
    colls = COLOUMS;
    @wire(getObjectInfo, {objectApiName:OPP_O})oppInfo;

    @wire(getPicklistValues, {fieldApiName: STAGE_F, recordTypeId:'$oppInfo.data.defaultRecordTypeId'})
    picklistHandler({data,error}){
        if(data){
            this.stageOps = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHander(event){
        const selectedStage = event.target.value;
        getMatchingOpps({stage:selectedStage})
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
                this.error = error;
            })
    }
}