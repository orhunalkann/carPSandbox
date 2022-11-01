public class Car {


    public string carColor = '';
    public string carName = '';

    integer maxSpeedKmPerHr = 150;

    public void drive() {
        switchOn();
        system.debug('driving ' + carName);
    }

    public void drivingMaxSpeed() {
        drive();
        string drivingDesp = 'driving ' + carName + ' at ' + maxSpeedKmPerHr + 'km/hr';
        system.debug(drivingDesp);
    }

    //this is class body
    //if we change anything in VS code, in our class
    // Save the file.
        ///WE NEED to deploy again.
    //if you change -> you SAVE -> you deploy?
    //GOT IT????
    
    //method name = switchOn
    public void switchOn(){
        system.debug('Starting theaaarrr CAR NOW;).');
    }
}


//this is outside of class.

