

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class StepCounterTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */



public class StepCounterTest {

    @Test
    public void testAddSteps() {
        StepCounter counter = new StepCounter();
        counter.addSteps(250);
        counter.addSteps(-50);
        assertEquals(250, counter.getSteps());
    }

    @Test
    public void testReset() {
        StepCounter counter = new StepCounter();
        counter.addSteps(250);
        counter.reset();
        assertEquals(0, counter.getSteps());
    }
}
