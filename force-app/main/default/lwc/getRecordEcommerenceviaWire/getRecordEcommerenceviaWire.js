import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import NAME_F from '@salesforce/schema/Ecommerce_Product__c.Name';
import CATEGORY_F from '@salesforce/schema/Ecommerce_Product__c.Category__c';
import INTRODATE_F from '@salesforce/schema/Ecommerce_Product__c.Introduced_Date__c';
import PRICE_F from '@salesforce/schema/Ecommerce_Product__c.Price__c';
import DESC_F from '@salesforce/schema/Ecommerce_Product__c.Description__c'

export default class GetRecordEcommerenceviaWire extends LightningElement {

    name;
    category;
    introdate;
    price;
    desc;

    recId = 'a0A4x00000FQMzxEAH';
    @wire(getRecord,{
        recordId:'$recId',
        layoutTypes:['Full'],
        modes:['View']
    })
    infoHandler({data, error}){
        if(data){
            console.log(data);
            this.name = getFieldValue(data, NAME_F);
            this.category = getFieldValue(data, CATEGORY_F);
            this.introdate = getFieldDisplayValue(data, INTRODATE_F);
            this.price = getFieldDisplayValue(data, PRICE_F);
            this.desc = getFieldValue(data, DESC_F);
        }
        if(error){
            console.error(error);
        }
    }
}