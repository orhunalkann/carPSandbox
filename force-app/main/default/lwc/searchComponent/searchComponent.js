import getMatchingContacts from '@salesforce/apex/contactCtrl2.getMatchingContacts';
import RightSize from '@salesforce/schema/Dashboard.RightSize';
import { LightningElement } from 'lwc';

const COLOM = [
    {label:'First Name', type:'text', fieldName:'FirstName'},
    {label:'Last Name', type:'text', fieldName:'LastName'},
    {label:'Title', type:'text', fieldName:'Title'},
    {label:'Department', type:'text', fieldName:'Department'}

]

export default class SearchComponent extends LightningElement {
    
    contacts;
    colums=COLOM;
    eror;

    searchHandler(event){
        const search = event.target.value;

        if(search.length == 0){
            this.contacts = undefined;
        }else{
            getMatchingContacts({searchKey: search})
                .then(result => {
                    if(result.length == 0){
                        this.contacts = null;
                        this.eror = 'Please use some other search criteria';
                    }else{
                        this.contacts = result;
                        this.eror = null;
                    }
                })
                .catch(err => {
                    this.error = err.body.message;
                    this.contacts = undefined;
                })
        }
    }
}