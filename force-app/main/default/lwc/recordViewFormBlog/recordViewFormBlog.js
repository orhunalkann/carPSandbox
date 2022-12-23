import { LightningElement } from 'lwc';
import BLOG_O from '@salesforce/schema/Blog__c'
import B_NAME from '@salesforce/schema/Blog__c.Name'
import AUTHOR_F from '@salesforce/schema/Blog__c.Author__c'
import TITLE_F from '@salesforce/schema/Blog__c.Title__c'
import TOPIC_F from '@salesforce/schema/Blog__c.Topic__c'
import BODY from '@salesforce/schema/Blog__c.Body__c'

export default class RecordViewFormBlog extends LightningElement {

    objectName = BLOG_O;
    recordId = 'a094x00001x1jFzAAI';

    fields = {
        name:B_NAME,
        author:AUTHOR_F,
        title:TITLE_F,
        topic:TOPIC_F,
        body:BODY
    }
}