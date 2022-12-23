import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import NAME_F from '@salesforce/schema/Account.Name';
import TYPE_F from '@salesforce/schema/Account.Type';
import ANNREV_F from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_F from '@salesforce/schema/Account.Phone';

export default class GetRecordAccountviaWire extends LightningElement {

    name;
    type;
    annrev;
    phone;
    recId = '0014x00001PwBZDAA3';
    @wire(getRecord,{
        recordId:'$recId',
        layoutTypes:['Full'],
        modes:['View']
    })
    infoHandler({data, error}){
        if(data){
            console.log(data);
            this.name = getFieldValue(data, NAME_F);//data.fields.Name.value;
            this.type = getFieldValue(data, TYPE_F);
            this.annrev = getFieldDisplayValue(data, ANNREV_F);
            this.phone = getFieldValue(data, PHONE_F);
        }
        if(error){
            console.error(error);
        }
    }
}