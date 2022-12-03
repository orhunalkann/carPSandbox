public class rankHandler {
    public string rankPrize(integer rank){
        string prize = '';

        if(rank == 1){
            prize = 'Gold';
        }else if(rank == 2){
            prize = 'Silver';
        }else if(rank == 3){
            prize = 'Bronze';
        }else{
            if (rank <10){
                prize = 'Greater than 3, less than 10 Rank';
            }else{
                prize = 'Greater than 10';
            }
        }

        return prize;
    }

    public string rankPrizeSwitch(integer rank){
        string prize = '';
        switch on rank {
            when 1 {
                prize = 'Gold';
            } when 2{
                prize = 'Silver';
            }
            when 3{
                prize = 'Bronze';
            }
            when 4,5,6,7,8,9,10{
                prize = 'Top 10 congratulations';
            }
            when else {
                prize = 'practice more';
            }
        }

        return prize;
    }
}