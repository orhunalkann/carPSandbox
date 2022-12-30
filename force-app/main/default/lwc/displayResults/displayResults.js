import { api, LightningElement } from 'lwc';

export default class DisplayResults extends LightningElement {
    @api resul;
    @api columns
    @api error;
}