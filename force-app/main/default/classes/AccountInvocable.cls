public class AccountInvocable {
@InvocableMethod(label='Update Opportunities' 
                 description='Update stageName of given accounts related opps to "close lost".' 
                 category='Account')
    public static void updateOpps(list<Id> accIds){
        List<Opportunity> opps = [Select Id, StageName From Opportunity Where AccountId IN :accIds];
        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.StageName = 'Closed Lost';
            }
            try{
                update opps;
            }catch(Exception ex){
                System.debug(ex.getMessage());
            }
        }
        }
    }