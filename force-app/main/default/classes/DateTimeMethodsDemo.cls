public class DateTimeMethodsDemo {
    public void calculateAgeInMonths(){
        date birthDay = date.newInstance(1995, 9, 12);
        date todayDate = date.today();

        integer fark = birthDay.monthsBetween(todayDate);
        system.debug(fark);
    }

    public void calculateAgeInDays(){
        date birthDay = date.newInstance(1995, 9, 12);
        date todayDate = date.today();

        integer farks = birthDay.daysBetween(todayDate);
        system.debug(farks);
    }

    public void printSubsEndDate() {
        date todayDate = date.today();
        date endDate = todayDate.addDays(1000);

        system.debug('Subs end date is ' + endDate);

        integer endDateMonth = endDate.month();
        system.debug('Subs end date month is ' + endDateMonth);
        integer endDateYear = endDate.year();
        system.debug('Subs end date year is ' + endDateYear);


        //print Year and month of end date
    }

    public void printOfferEndDateTime (){
        datetime dtNow = datetime.now();
        datetime dtOfferEnd = dtNow.addHours(55);
        system.debug('Offer will be experied : ' + dtOfferEnd);

    }
}