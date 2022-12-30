import { LightningElement } from 'lwc';

export default class SliderParent extends LightningElement {
    asd;
    changeHandler(event){
        const inp = event.target.value;
        this.asd = inp;
    }

    clickHand(){
        this.template.querySelector('c-slider-child').resetHand();
        this.template.querySelector('lightning-input').value = null;

    }
}