public class ListDemoForLoop {
    public static void iintegerList() {
        list<integer> listInteger = new List<integer>();
        listInteger.add(15);
        listInteger.add(23);
        listInteger.add(41);
        listInteger.add(99);
        listInteger.add(14);

        for (integer eachInteger : listInteger)
            system.debug(eachInteger);
    }

    public static integer add(list<integer> intList){
        integer returnSum = 0;

        for (integer eachInteger : intList){
            returnSum += eachInteger;
            system.debug(returnSum);
        }

        return returnSum;
        
    }
}