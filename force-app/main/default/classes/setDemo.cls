public class setDemo {
    public static void citySet() {
        set<string> cities = new Set<string>();

        cities.add('Tokyo');
        cities.add('Istanbul');
        cities.add('San Francisco');
        cities.add('Los Angeles');
        cities.add('New York');
        cities.add('Ankara');
        cities.add('San Francisco');
        cities.add('TOKYO');

        system.debug('Cities set ' + cities);
        system.debug(cities.size());

    }

    public static void randomIntegerSet() {
        set<integer> integers = new Set<integer>();

        integers.add(1);
        integers.add(2);
        integers.add(32);
        integers.add(233);
        integers.add(412);

        system.debug('Random integer set ' + integers);

    }

    public static set<integer> setFromList(list<integer> l1){
        set<integer> set1 = new Set<integer>();
        set1.addAll(l1);

        return set1;
        
    }

    public static void capitalizeAllSet(){

        set<string> set1 = new Set<string>{'water', 'fire', 'earth', 'air'};
        set<string> set2 = new Set<string>();

        for (string eachStr : set1) {
            
            string newValue = eachStr.toUpperCase();
            set2.add(newValue);

            set
        }

        system.debug(set2);

    }
}
