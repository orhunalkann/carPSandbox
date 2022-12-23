import { LightningElement } from 'lwc';

export default class MyNameRole extends LightningElement {
    username = 'orhunalkann';
    role;
    roleOptions = [
        {label:'Salesforce Admin', value:'Salesforce Admin'},
        {label:'Salesforce Developer', value:'Salesforce Developer'},
        {label:'Salesforce Architect', value:'Salesforce Architect'}
    ];

    changeHandler(event){
        const fieldC = event.target.label;
        if(fieldC === "Enter your username"){
            this.username = event.target.value;
        } else{
            this.role = event.target.value;
        }
    }
}