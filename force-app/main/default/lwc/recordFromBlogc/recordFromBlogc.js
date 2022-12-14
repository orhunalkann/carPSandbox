import { LightningElement } from 'lwc';
import AUTHOR from '@salesforce/schema/Blog__c.Author__c'
import NAME from '@salesforce/schema/Blog__c.NAME'
import BODY from '@salesforce/schema/Blog__c.Body__c'
import TITLE from '@salesforce/schema/Blog__c.Title__c'
import TOPIC from '@salesforce/schema/Blog__c.Topic__c'
import BLOG from '@salesforce/schema/Blog__c'
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class RecordFromBlogc extends LightningElement {

    fields =[AUTHOR,NAME,BODY,TITLE,TOPIC];
    objectNam = BLOG;
    blogId ='a094x00001x1jLaAAI';

    successHandler(){
        //toast message
        //import { ShowToastEvent } from 'lightning/platformShowToastEvent';
        
        const successEvent = new ShowToastEvent({
            title:'Success',
            message:'Blog__c record has been saved',
            variant:'success',
        });
        
        this.dispatchEvent(successEvent);
    }


}