public with sharing class StringArrayTest {
    public static list<string> generateStringArray(integer numberOfStrings) {
        list<string> stringArray = new List<string>();

        for(integer i = 0; i < numberOfStrings; i++){
            string a = 'Test ' + i;
            stringArray.add(a);
        }
        system.debug(stringArray);
        return stringArray;

    }
}
