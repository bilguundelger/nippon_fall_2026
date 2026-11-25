

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class ParkingMeterTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */




public class ParkingMeterTest {

    @Test
    public void testAddTime() {
        ParkingMeter meter = new ParkingMeter();
        meter.addTime(30);
        meter.addTime(-10);
        assertEquals(30, meter.getMinutes());
    }

    @Test
    public void testTickMinimum() {
        ParkingMeter meter = new ParkingMeter();
        meter.addTime(1);
        meter.tick();
        meter.tick();
        assertEquals(0, meter.getMinutes());
    }
}
