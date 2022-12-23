import { LightningElement, wire } from 'lwc';
import FNAME_F from '@salesforce/schema/Contact.FirstName';
import LNAME_F from '@salesforce/schema/Contact.LastName';
import MAIl_F from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';

const COLOMNS = [
    {label: 'First Name', fieldName: FNAME_F.fieldApiName, type:'text'},
    {label: 'Last Name', fieldName: LNAME_F.fieldApiName, type:'text'},
    {label: 'Email', fieldName: MAIl_F.fieldApiName, type:'text'}
];
export default class ContactList extends LightningElement {

    coloums = COLOMNS;
    @wire(getContacts)contacts;
    
    get errors() {
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }
}