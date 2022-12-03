public class mapDemo {
    public static string retriveMonth(integer a){
        string month = '';

        map<integer, string> months = new map<integer, string>();
        months.put(1, 'January');
        months.put(2, 'February');
        months.put(3, 'March');
        months.put(4, 'April');

        months.put(5, 'May');
        months.put(6, 'June');
        months.put(7, 'July');
        months.put(8, 'August');
        
        months.put(9, 'September');
        months.put(10, 'October');
        months.put(11, 'November');
        months.put(12, 'December');

        month = months.get(a);


        return month;
    }
}