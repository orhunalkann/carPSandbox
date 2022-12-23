import { LightningElement } from 'lwc';

export default class TemplateLooping3 extends LightningElement {
    blogs = [
        {
            Id: "1",
            Topic: "Salesforce Flows",
            Description: "Salesforce flows are hot in the industry. Salesforce has invested a lot in order to make these flows really powerful and make the one and only automation tool"
        },
        {
            Id: "2",
            Topic: "Apex Triggers",
            Description: "Salesforce is going to fade apex triggers slowly... not immediately but definitely. Flows are going to occupy its space!"
        },
        {
            Id: "3",
            Topic: "Lightning Web Components",
            Description: "The awesome UI tool using which we can build beautiful screens"
        }
    ];
}