//How to fetch records from Custom Settings?
//1. SOQL
//2. use getAll() and getInstance method
map<string, country_code__c> isoMap = country_code__c.getAll();
system.debug(isoMap);

for(string cn : isoMap.keySet()){
    country_code__c cs = isoMap.get(cn);
    system.debug(cn + 'Country Code is ' + cs.iso_code__c);
}

//account record --> billing Country -> United States.
string c1 = 'United States';
//getInstance(NAME)
Country_code__c c1code = Country_code__c.getInstance(c1); //Account newRecord = Trigger.newMap.get(id)
string isoCodeC1 = c1code.iso_code__c; //newRecord.name
system.debug(c1 + ' isoCODE is ' + isoCodeC1);

string c2 = 'Canada';
system.debug(c2 + 'iso Code is ' + Country_code__c.getInstance(c2).iso_code__c);