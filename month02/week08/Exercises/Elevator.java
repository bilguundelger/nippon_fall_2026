
public class Elevator {
    private int currentFloor;
    private int maxFloor;
    private boolean doorOpen;

    public Elevator(int topFloor) {
        currentFloor = 1;
        doorOpen = false;
        if (topFloor >= 2) {
            maxFloor = topFloor;
        } else {
            maxFloor = 5;
        }
    }

    public int getCurrentFloor() {
        return currentFloor;
    }

    public boolean isDoorOpen() {
        return doorOpen;
    }

    public void openDoor() {
        doorOpen = true;
    }

    public void closeDoor() {
        doorOpen = false;
    }

    public boolean goToFloor(int targetFloor) {
        if (!doorOpen && targetFloor >= 1 && targetFloor <= maxFloor) {
            currentFloor = targetFloor;
            return true;
        }
        return false;
    }
}