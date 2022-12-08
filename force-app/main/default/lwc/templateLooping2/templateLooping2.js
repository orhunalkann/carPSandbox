import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    contacts = [
        {
            Id:'1',
            Name:'Soft Innovas',
            Industry: 'Education',
            Rating:'Hot'
        },
        {
            Id:'2',
            Name:'Universal Containers',
            Industry: 'Software Development',
            Rating:'Cold'
        },
        {
            Id:'3',
            Name:'Meghas',
            Industry: 'Hardware Development',
            Rating:'Warm'
        }
    ];
}