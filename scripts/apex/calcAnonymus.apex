calculator c = new calculator();
c.printNewMessages('Orhunalkan10000');

string ornek = 'Hello World World';
c.printNewMessages(ornek);


string allResults = c.printAndReturnMessages('Hello Salesforce');
system.debug(allResults);

integer x = c.add(5,10);
system.debug(x);

integer uzun = c.calculateStringLength('Orhun');
system.debug(uzun);