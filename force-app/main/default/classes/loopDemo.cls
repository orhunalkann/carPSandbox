public class loopDemo {
    public void print_int_while(){
        integer a = 1;
        while(a < 25){
            system.debug(a);
            a++;
        }
    }

    public void print_int_for_loop(integer n){
        for(integer a = 0; a < n; a++){
            system.debug(a);
        }
    }

    public void print_odd_numbers(integer startInt, integer endInt){
        for (integer a = startInt; a < endInt; a++){
            integer modd = math.mod(a, 2);
            if (modd == 1){
                system.debug(a);
            }
        }
    }
}