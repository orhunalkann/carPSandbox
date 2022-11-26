public class NewCaseListController {
    public list<case> getNewCases(){
        list<case> rtrnList = new list<case>();
        rtrnList = [select id, caseNumber from case where status = 'New'];
        return rtrnList;
    }
}