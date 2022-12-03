public class Calculator {
    public static void printNewMessages(string msg) {
        system.debug(msg);
    }

    public static string printAndReturnMessages(string msg) {
        string returnStr = msg + '...OK cool';
        return returnStr;
    }

    public static integer add(integer a, integer b) {
        integer sum = a + b;
        return sum;
    }

    public static integer calculateStringLength(string s1) {
        integer x = s1.length();
        return x;
    }
}