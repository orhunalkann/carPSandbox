import getMatchingOpps from '@salesforce/apex/opportunityCtrl.getMatchingOpps';
import { LightningElement, wire } from 'lwc';

const COLOUMS = [
    {label: "Opp Name", fieldName: "Name", type: "text"},
    {label: "Opp Type", fieldName: "Type", type: "text"},
    {label: "Stage", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
    
];
export default class wiredApex2 extends LightningElement {
    
    coloums = COLOUMS;
    

    @wire(getMatchingOpps, {stage:"Closed Lost"})opps;

    
}