import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class DeleteRecordbyRecId extends LightningElement {
    recId;

    changeHandler(event){
            this.recId = event.target.value;
    }

    deleteRec(){
        const recIdc = this.recId;

        deleteRecord(recIdc)
        .then(result => {
            this.displayToast("Success", "Record has been deleted successfully!", "success");
            //this.template.querySelector("<lightning-input type='text'").value = null;
        })
        .catch(error => {
            this.displayToast("Error", error.body.message /*"Error ocured"*/, "error");
        })
        
    }

    displayToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}