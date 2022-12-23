import { LightningElement } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';

const COLOUMS = [
    {label:'Account Name', fieldName:'Name', type:'text'},
    {label:'Type', fieldName:'Type', type:'text'},
    {label:'Industry', fieldName:'Industry', type:'text'},
    {label:'Annual Revenue', fieldName:'AnnualRevenue', type:'currency'}
]

export default class ImperativeApex1 extends LightningElement {
    
    accs;
    colls = COLOUMS;

    
    clickHandler(){
        getTopAccounts()
            .then(result =>{
                this.accs = result;
            })
            .catch(error =>{
                console.error(error);
            })
    }

    hideHandler(){
        this.accs = null;
        //this.accs = undefined;
    }
}