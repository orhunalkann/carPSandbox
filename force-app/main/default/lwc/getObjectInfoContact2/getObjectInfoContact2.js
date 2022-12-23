import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

import CONT_OB from '@salesforce/schema/Contact'

export default class GetObjectInfoContact2 extends LightningElement {

    empRtId;
    studentRtId;

    @wire(getObjectInfo, {objectApiName:CONT_OB})
    infoHandler({data, error}){
        if(data){
            console.log(data);
            this.studentRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos

            //GET RECORD TYPE ID&IDS

            //        objectclass.keyMethod.find(rtidKey => map.key.checkvalue === whatever you need)
            this.empRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === 'Employee Contact')
        }
        if(error){
            console.error(error);
        }
    }
    
}