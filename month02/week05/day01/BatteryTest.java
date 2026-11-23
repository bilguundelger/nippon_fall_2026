

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class BatteryTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */


public class BatteryTest {

    @Test
    public void testMaximumCharge() {
        Battery battery = new Battery();
        battery.chargeBattery(80);
        assertEquals(100, battery.getCharge());
    }

    @Test
    public void testInvalidCharging() {
        Battery battery = new Battery();
        battery.chargeBattery(0);
        battery.chargeBattery(-20);
        assertEquals(50, battery.getCharge());
    }
}

