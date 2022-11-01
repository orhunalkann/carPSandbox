public class Calculator {
    public void printNewMessages(string msg) {
        system.debug(msg);
    }

    public string printAndReturnMessages(string msg) {
        string returnStr = msg + '...OK cool';
        return returnStr;
    }

    public integer add(integer a, integer b) {
        integer sum = a + b;
        return sum;
    }

    public integer calculateStringLength(string s1) {
        integer x = s1.length();
        return x;
    }
}
