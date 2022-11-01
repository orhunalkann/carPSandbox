public class calculatorSimple {
    public static integer add1(integer a, integer b){
        integer sum = a + b;
        system.debug(sum);
        return sum;
    }

    public static integer add2(integer i, integer j, integer k){
        system.debug('inside add method with 3 params');
        integer sum = i+j+k;
        return sum;
    }
}
// static yazinca ''classadini.methodadini'' boyle kullanabiliyoruz