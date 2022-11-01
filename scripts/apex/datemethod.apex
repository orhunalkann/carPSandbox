dateMethodClass dos = new dateMethodClass();
date someDate = date.newInstance(1999, 10, 15);
boolean answer = dos.leapYearCheck(someDate);
system.debug(answer);

date someDate2 = date.newInstance(1991, 10, 15);
boolean answer2 = dos.leapYearCheck(someDate2);
system.debug('1991-10-15 is leap year?' + answer2);

date someDate3 = date.newInstance(2008, 10, 15);
boolean answer3 = dos.leapYearCheck(someDate3);
system.debug('is 2008 a leap year?' + answer3);
