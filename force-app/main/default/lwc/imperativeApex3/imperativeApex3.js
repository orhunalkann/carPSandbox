import getMatchingContacts from '@salesforce/apex/contactCtrl2.getMatchingContacts';
import { LightningElement } from 'lwc';

export default class ImperativeApex3 extends LightningElement {

    contacts;
    error;

    changeHandler(event){
        const searchW = event.target.value;
        if(searchW.length>0){
            getMatchingContacts({searchKey:searchW})
                .then(result => {
                    if(result.length > 0){
                        this.contacts = result;
                        this.error = undefined;
                    }else{
                        this.contacts = undefined;
                        this.error = 'Try different words!'
                    }
                })
        }else{
            this.contacts=undefined;
            this.error = undefined;
        }
            
    }
    
    
}