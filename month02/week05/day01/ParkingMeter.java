
/**
 * Write a description of class ParkingMeter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class ParkingMeter {

    private int minutes;

    public ParkingMeter() {
        minutes = 0;
    }

    public int getMinutes() {
        return minutes;
    }

    public void addTime(int mins) {
        if (mins > 0) {
            minutes = minutes + mins;
        } else {
            System.out.println("Алдаа: 0-ээс их минут оруулна уу!");
        }
    }

    public void tick() {
        if (minutes > 0) {
            minutes = minutes - 1;
        }
    }
}
