public class Deneme2 {
        public void printNewDate() {
            Date newDate1 = Date.today();
            system.debug(newDate1);

            Date anyDate1 = Date.newInstance(1995, 9, 12);
            system.debug('My birthday is ' + anyDate1);
        }

        public void printNewTime() {
            time myTime = time.newInstance(5, 1, 2, 5);
            system.debug(myTime);
        }

        public void printNewDateTime() {
            datetime newDateTime = datetime.newInstance(1995, 9, 12, 13, 0, 1);
            system.debug(newDateTime);
        }

        public void printNewDate2() {
            date newDate = date.newInstance(1995, 9, 12);
            time newTime = time.newInstance(13, 0, 1, 25);

            datetime newDateTime = datetime.newInstance(newDate, newTime);
            system.debug(newDateTime);
        }

        public void printNewDateTimeNow() {
            datetime nowTime = datetime.now();
            system.debug('Now the time is : ' + nowTime);
        }

        public void printLongTime() {
            long a = 3221221123L;
            datetime s = datetime.newInstance(a);
            system.debug('This is a long time' + s);
        }
    }