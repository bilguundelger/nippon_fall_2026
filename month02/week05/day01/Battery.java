
/**
 * Write a description of class Battery here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class Battery {

    private int charge; // 0-ээс 100 хооронд байх цэнэгийн хувь

    public Battery() {
        charge = 50;
    }

    public int getCharge() {
        return charge;
    }

    public void chargeBattery(int amount) {
        if (amount > 0) {
            charge = charge + amount;

            if (charge > 100) {
                charge = 100;
            }
        } else {
            System.out.println("Алдаа: 0-ээс их дүн оруулна уу!");
        }
    }

    public void useBattery(int usage) {
        if (usage > 0) {
            charge = charge - usage;

            if (charge < 0) {
                charge = 0;
            }

    }
}
}
