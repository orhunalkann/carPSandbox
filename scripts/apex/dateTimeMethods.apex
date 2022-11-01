DateTimeMethodsDemo dtm = new DateTimeMethodsDemo();
dtm.calculateAgeInMonths();
dtm.calculateAgeInDays();
dtm.printSubsEndDate();
dtm.printOfferEndDateTime();

datetime birthDate = datetime.newInstance(1995, 9, 12, 7, 45, 00);
long longBirthDate = birthDate.getTime();
system.debug(longBirthDate);