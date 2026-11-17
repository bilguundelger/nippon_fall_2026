
/**
 * Write a description of class elevator here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Elevator {
    
    private int currentFloor;
    private int totalTrips;

    
    public Elevator() {
        currentFloor = 1;
        totalTrips = 0;
    }

    
    public void goUp(int floors) {
        currentFloor += floors;
        totalTrips++;
    }

    
    public void goDown(int floors) {
        currentFloor -= floors;
        totalTrips++;
    }

    
    public int getCurrentFloor() {
        return currentFloor;
    }

    
    public String getStatus() {
        return "Elevator is on floor " + currentFloor + " (Total trips: " + totalTrips + ")";
    }
}