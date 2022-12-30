import { api, LightningElement } from 'lwc';

export default class ProgressBar extends LightningElement {
    @api size;
    @api value;

    @api resetProgress(){
        this.value = 0;
        this.size = 'Medium';
    }
}