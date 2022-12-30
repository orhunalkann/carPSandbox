import studentSearcher from '@salesforce/apex/studentSearcher.studentSearcher';
import { LightningElement } from 'lwc';

export default class StudentParent extends LightningElement {

    deeta;
    errorr;

    COLOM = [
        {label:'Student Name', fieldName:'Student_Name__c', type:'text'},
        {label:'Class', fieldName:'Class__c', type:'number'},
        {label:'Phone', fieldName:'Mobile__c', type:'text'},
        {label:'Email', fieldName:'Email__c', type:'text'},
        {label:'Postal Code', fieldName:'Postal_Code__c', type:'text'}
    ];
    changeHandler(event){
        const postcode = event.target.value;
        if(postcode == 0){
            this.template.querySelector('c-student-child').delHandler();
        }else{
            studentSearcher({post: postcode})
                .then(result => {
                    if(result.length == 0){
                        this.deeta = null;
                        this.errorr = 'Error occurred while searching';
                    }else{
                        this.deeta = result;
                        this.errorr = null;
                    }
                })
                .catch(error => {
                    this.errorr = error;
                    this.deeta = null;
                })
            }
    }


}