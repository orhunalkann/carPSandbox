import { LightningElement } from 'lwc';
import ACCOUNT_OBJ from '@salesforce/schema/Account'
import NAME_F from '@salesforce/schema/Account.Name'
import TYPE_F from '@salesforce/schema/Account.Type'
import PHONE_F from '@salesforce/schema/Account.Phone'
import INDUSTRY_F from '@salesforce/schema/Account.Industry'
import RATING_F from '@salesforce/schema/Account.Rating'
export default class LightningAccountRecordViewForm extends LightningElement {
    recordId = '0014x00001STPsmAAH';
    objectName = ACCOUNT_OBJ;
    fields = {
        accName:NAME_F,
        accType:TYPE_F,
        accPhone:PHONE_F,
        accInd:INDUSTRY_F,
        accRating:RATING_F
    }

}