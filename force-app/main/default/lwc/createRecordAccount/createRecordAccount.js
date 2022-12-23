import { LightningElement, track, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { createRecord } from 'lightning/uiRecordApi';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TIER_F from '@salesforce/schema/Account.Support_Tier__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';



export default class CreateRecordAccount extends LightningElement {
    industryOptions = [];
    tierOptions = [];
    @track formdata = {}; //Track data changes and displays new values, since we take input and create object in js with "sobjApiName = {}""
    /* Aim is to prepare data in this format
    formdata = {
        Name: "Test Account",
        Industry: "Biotechnology",
        AnnualRevenue: 100000000
    }*/
    showNotification() {
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Account created successfully',
            variant: 'success',
        });
        this.dispatchEvent(evt);
        
    }
    showErrorNotification() {
        const evt = new ShowToastEvent({
            title: 'Error',
            message: 'Something went wrong',
            variant: 'error',
        });
        this.dispatchEvent(evt);
    }
    //wire to get picklist value. getObjectInfo id for getPiclistValues method
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accInfo;
    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    tierinfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}) {
        if(data) {
            this.industryOptions = data.values;
        }
        if(error) {
            console.error(error);
        }
    }
    @wire(getPicklistValues, {fieldApiName: TIER_F, recordTypeId: '$tierinfo.data.defaultRecordTypeId'})
    pcHandler({data, error}) {
        if(data) {
            this.tierOptions = data.values;
        }
        if(error) {
            console.error(error);
        }
    }

    //data type creater. 
    changeHandler(event) {
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;
    }

    cancelAccount() {
        this.template.querySelector("form.accountform").reset();
        this.formdata = {};
    }

    saveAccount() {
        //populate rating & priority based on revenue
        const revenue = Number(this.formdata.AnnualRevenue);
        if(revenue >= 100000000) {
            this.formdata["Rating"] = "Hot";
            this.formdata["CustomerPriority__c"] = "High";
        } else if(revenue < 100000000 && revenue >= 10000000) {
            this.formdata["Rating"] = "Warm";
            this.formdata["CustomerPriority__c"] = "Medium";
        } else {
            this.formdata["Rating"] = "Cold";
            this.formdata["CustomerPriority__c"] = "Low";
        }

        //check before save
        //log the object so far
        console.log("entered data: " + JSON.stringify(this.formdata));

        //prepare record input for create record
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        }

        //create record v
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.showNotification()
                this.template.querySelector("form.accountform").reset();
                this.formdata = {};
                //add toast message
            })
            .catch(error => {
                console.error(error);
                this.showErrorNotification()
            })
    }
}