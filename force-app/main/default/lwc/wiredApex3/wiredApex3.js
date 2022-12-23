import getLeads from '@salesforce/apex/LeadCtrl.getLeads';
import { LightningElement, wire } from 'lwc';

export default class WiredApex3 extends LightningElement {
    @wire(getLeads)leads;
}