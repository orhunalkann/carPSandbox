import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label:'Account Name', fieldName: 'Name', type:'text'},
    {label:'Type', fieldName: 'Type', type:'currency'},
    {label:'Industry', fieldName: 'Industry', type:'text'},
    {label:'Annual Revenue', fieldName: 'AnnualRevenue', type:'currency'}
]
export default class WiredApex extends LightningElement {
    
    columns = COLUMNS;
    
    @wire(getTopAccounts)accounts;

}