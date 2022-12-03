public class cat {
    public string name;
    public string color;

    public cat(string nme, string clor){
        name = nme;
        color = clor;
        sleepimg();

    }

    public void sleepimg() {
        system.debug(name + ' is sleeping');
    }
}