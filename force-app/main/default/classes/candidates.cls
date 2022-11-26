public class candidates {
    public string name;
    public string gender;
    public static string companyName;
    public static integer counter = 0;

    public candidates(){
        system.debug('constructor called');
        candidates.counter++;
    }

    public void printCandidates() {
        system.debug('candidate name is ' + name);
        system.debug('gender is ' + gender);
        system.debug('company name is ' + companyName);
        system.debug('==== End ====');
    }

    public static void printCandidatesInfos() {
        system.debug('company name is ' + companyName);
    }
}