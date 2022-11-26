public class listDemo {
    public static string candidateList(integer i){
        list <string> listCandidate = new List<string>();
        listCandidate.add('Marc');
        listCandidate.add('Elon');
        listCandidate.add('Bill');
        listCandidate.add('Marc');
        //system.debug(listCandidate);

        
        //string returnstr = listCandidate[i];
        string returnstr = '';
        if(i >= 0 && listCandidate.size() > i)
            returnstr = listCandidate[i];
        else
            returnstr = 'No value found';    
        return returnstr;
    }

    public static void randomIntegerList(){
        list<integer> listInteger = new List<integer>();

        listInteger.add(15);
        listInteger.add(23);
        listInteger.add(41);
        listInteger.add(99);
        listInteger.add(14);
        system.debug(listInteger);

        integer index3value = listInteger.get(3);
        system.debug('index3value: ' + index3value);

    }

    public static void allCats(){
        cat falconsCat = new cat('fluffykins', 'white');
        cat eaglesCat = new cat('simba', 'black');
        cat streetCat = new cat('van', 'brown');

        list<cat> cats = new List<cat>();

        cats.add(falconsCat);
        cats.add(eaglesCat);
        cats.add(streetCat);
        cats.add(falconsCat);
        cats.add(eaglesCat);
        

        system.debug('List of cats: ' + cats);
        
        if(!cats.isEmpty()){
            cat catAt3 = cats[3];
            string catAt3Name = cats[3].name;


            system.debug('cat At3 : ' + catAt3);
            system.debug('cat At 3 Name: ' + catAt3Name);
        }


    }
}