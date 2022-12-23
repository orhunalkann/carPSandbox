import { LightningElement } from 'lwc';

export default class ConditionalRendering3 extends LightningElement {
    showContent = false;

    clickHandler(){
        if (this.showContent==true){
            this.showContent = false;
        }else{
            this.showContent = true;
        }
    }
}