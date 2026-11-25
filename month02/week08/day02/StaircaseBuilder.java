public class StaircaseBuilder {
    public void buildStairs(int steps){
        for (int i = 0; i < steps; i++){
        Square step = new Square();
        step.changeSize(25);
        step.changeColor("blue");
        int targetX = 50 + (i * 25);
        int targetY = 220 - (i * 25);
        step.moveHorizontal(targetX - 60);
        step.moveVertical(targetY - 50);
        step.makeVisible();
        
        
    }
}
}