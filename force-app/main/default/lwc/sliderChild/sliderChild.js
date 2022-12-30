import { api, LightningElement } from 'lwc';

export default class SliderChild extends LightningElement {
    @api val;

    @api resetHand(){
        this.val = 50;
    }
}