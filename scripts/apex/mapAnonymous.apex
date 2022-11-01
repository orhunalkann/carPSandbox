map<string, string> mapCntCurrency = new map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Turkey', 'Lira');
mapCntCurrency.put('China', 'Yen');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee');

system.debug('map country currency: ' + mapCntCurrency);

string atr = mapCntCurrency.get('France');
system.debug('France currency: ' + atr);

// 'KEYS' WE GET INTO 'SET'
set<string> allCountries = mapCntCurrency.keySet();
system.debug('allCountries: ' + allCountries);


// WE CAN GET JUST 'LIST' OF VALUES
list<string> allCurrencies = mapCntCurrency.values();
system.debug('allCurrencies: ' + allCurrencies);


for(string eachCountry: allCountries){

    string eachCurrency = mapCntCurrency.get(eachCountry);
    system.debug(eachCountry + ' ==> ' + eachCurrency);

}