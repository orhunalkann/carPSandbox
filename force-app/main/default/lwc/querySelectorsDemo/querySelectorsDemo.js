import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    fruits = ['Banana', 'Apple', 'Orange', 'Grape'];

    clickHandler(){
        //querySelector
        const h1elem = this.template.querySelector('h1');
        const pelem = this.template.querySelector('p');

        console.log(h1elem.innerText);
        h1elem.style.color='green';
        h1elem.style.backgroundColor='yellow';
        h1elem.style.border='2px solid red';
        
        pelem.style.color='orange';
        pelem.style.backgroundColor='blue';
        pelem.style.border='2px solid purple';

        const divElems = this.template.querySelectorAll('div.child');
        divElems.forEach(item =>{
            console.log(item.innerText);
            item.style.color = 'green';
            item.setAttribute('class', 'slds-align_absolute-center');
        })
    }
}