import { api, LightningElement } from 'lwc';


export default class StudentChild extends LightningElement {
    
    @api colonlar;
    @api info;
    @api err;

    @api delHandler(){
        this.info = null;
        this.err = null;
        this.colonlar = null;
    }
}