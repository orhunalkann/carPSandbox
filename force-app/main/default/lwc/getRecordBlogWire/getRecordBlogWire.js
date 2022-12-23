import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import AUTHOR_F from '@salesforce/schema/Blog__c.Author__c'
import NAME_F from '@salesforce/schema/Blog__c.Name'
import BODY_F from '@salesforce/schema/Blog__c.Body__c'
import TITLE_F from '@salesforce/schema/Blog__c.Title__c'
import TOPIC_F from '@salesforce/schema/Blog__c.Topic__c'

const FIELDS = [AUTHOR_F, NAME_F, BODY_F, TITLE_F, TOPIC_F];

export default class GetRecordBlogWire extends LightningElement {
    recId = 'a094x000024dhOgAAI';
    author;
    name;
    body;
    title;
    topic;

    @wire(getRecord,{
        recordId:'$recId', fields:FIELDS
    })
    infoHandler({data, error}){
        if(data){
            console.log(data);

            // Approach 1
            /*this.author = getFieldValue(data, AUTHOR_F)
            this.name = getFieldValue(data, NAME_F)
            this.body = getFieldValue(data,BODY_F)
            this.topic = getFieldValue(data,TOPIC_F)
            this.title = getFieldValue(data, TITLE_F)*/

            //Approach 2
            this.author = data.fields.Author__c.value;
            this.name= data.fields.Name.value;
            this.title = data.fields.Title__c.value;
            this.topic = data.fields.Topic__c.value;
            this.body = data.fields.Body__c.value;
        }
        if(error){
            console.error(error);
        }
    }
}