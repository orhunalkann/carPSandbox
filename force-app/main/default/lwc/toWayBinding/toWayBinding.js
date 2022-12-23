import { LightningElement } from 'lwc';

export default class ToWayBinding extends LightningElement {
    fullname = 'Orhun';
    title ='Salesforce Developer';

    changeHandler(event){
        // event is onkeyup
        // event.target => (onkeyup).target => lightning component(.value)
        this.title = event.target.value;

        // this. class ici variable icin sanirim
    }
}