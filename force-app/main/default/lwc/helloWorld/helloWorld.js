import { LightningElement } from 'lwc';
// support to HTML // JS Controller, controll action 
export default class HelloWorld extends LightningElement {
    fullname = 'Orhun';
    age = 27;
    location = {
        city : 'San Francisco',
        country : 'United States'
    }
}