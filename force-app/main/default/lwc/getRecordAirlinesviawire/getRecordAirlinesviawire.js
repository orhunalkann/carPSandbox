import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';


export default class GetRecordAirlinesviawire extends LightningElement {
    recordId = 'a0C4x000009PciTEAS';
    airlines;
    @wire(getRecord,{
        recordId:'$recordId',
        layoutTypes:['Full'],
        modes:['Edit']
    })
    inforHandler({data, error}){
        if(data){
            console.log(data);
            this.airlines = data;
        }
        if(error){
            console.error(error);
        }
    }
}