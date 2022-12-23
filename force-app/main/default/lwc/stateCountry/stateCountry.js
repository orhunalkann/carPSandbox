import { LightningElement, track } from 'lwc';

export default class StateCountry extends LightningElement {
    state;
    country;
    @track stateOpt = [
        {label:'California', value:'California'},
        {label:'Texas', value:'Texas'},
        {label:'Nevada', value:'Nevada'},
        {label:'Wisconsin', value:'Wisconsin'},
        {label:'British Columbia', value:'British Columbia'},
        {label:'Mexico City', value:'Mexico City'}
    ];

    @track countryOpt = [
        {label:'United States', value:'United States'},
        {label:'Canada', value:'Canada'},
        {label:'Mexico', value:'Mexico'}
    ]

    changeHandler(event){
        const checkPoint = event.target.label;
        if(checkPoint === 'Select your State'){
            this.state = event.target.value;
        }else if(checkPoint === 'Select your Country'){
            this.country = event.target.value;
        }
    }
}