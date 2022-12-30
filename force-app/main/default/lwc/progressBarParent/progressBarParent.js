import { LightningElement } from 'lwc';

export default class ProgressBarParent extends LightningElement {
    get sizeOptions(){
        return [
            {label:'Small', value:'Small'},
            {label:'Medium', value:'Medium'},
            {label:'Large', value:'Large'}
        ]
    }
    progressSize;
    progressValue;
    changeHandler(event){
        if(event.target.name == 'size'){
            this.progressSize = event.target.value;
        }else{
            this.progressValue = event.target.value;
        }
    }

    progressHandler(){
        this.template.querySelector('c-progress-bar').resetProgress;
    }

}