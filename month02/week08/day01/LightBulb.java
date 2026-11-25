
/**
 * Write a description of class LightBulb here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class LightBulb {
    private boolean isOn;
    private int brightness;

    public LightBulb() {
        isOn = false;
        brightness = 0;
    }

    public boolean getIsOn() {
        return isOn;
    }

    public int getBrightness() {
        return brightness;
    }

    public void turnOn() {
        isOn = true;

        if (brightness == 0) {
            brightness = 50;
        }
    }

    public void turnOff() {
        isOn = false;
        brightness = 0;
    }
}
