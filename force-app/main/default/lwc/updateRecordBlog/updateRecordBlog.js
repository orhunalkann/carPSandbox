import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';

import AUTHOR_F from '@salesforce/schema/Blog__c.Author__c';
import BODY_F from '@salesforce/schema/Blog__c.Body__c';
import TITLE_F from '@salesforce/schema/Blog__c.Title__c';
import TOPIC_F from '@salesforce/schema/Blog__c.Topic__c';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const fieldsa = [AUTHOR_F, TITLE_F, TOPIC_F, BODY_F];
export default class UpdateRecordBlog extends LightningElement {
    recId = 'a094x00001x1jLaAAI';
    @track formdata = {};
    @wire(getRecord, {recordId:'$recId',fields:fieldsa})
    //if i put outcome as property, go to outcome.data, outcome.detail etc..
    //if i put outcome as function, go to data...., error...
    outcome;
    

    changeHandler(event){
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    saveBlog(){
        this.formdata['Id'] = this.recId;
        const recordInput = {
            fields:this.formdata
        };
        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                this.dispalyToast('Success', 'Record updated successfully', 'success');
                
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