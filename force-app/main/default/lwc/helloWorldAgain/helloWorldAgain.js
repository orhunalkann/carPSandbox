import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }

  // local method to sum of 2 numbers
  sum(a,b){
    return a + b;
  }
}