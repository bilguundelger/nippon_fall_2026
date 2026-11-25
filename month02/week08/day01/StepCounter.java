
/**
 * Write a description of class StepCounter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

public class StepCounter {

    private int steps;

    public StepCounter() {
        steps = 0;
    }

    public int getSteps() {
        return steps;
    }

    public void addSteps(int count) {
        if (count > 0) {
            steps = steps + count;
        } else {
            System.out.println("Алдаа: Алхмын тоо эерэг байх ёстой!");
        }
    }

    public void reset() {
        steps = 0;
    }
}

