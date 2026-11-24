public class TargetDrawer {
    public void drawTarget(int rings) {
        for (int i = 0; i < rings; i++) {
            int size = 200 - (i * 30);
            if (size <= 0){
                break; 
            }
            Square s = new Square();
            s.changeSize(size);
            int targetX = 150 - (size / 2);
            int targetY = 150 - (size / 2);
            if(i % 2 == 0){
                s.changeColor("green");
                
            }else {
                s.changeColor("yellow");
            }
            s.moveHorizontal(targetX - 60);
            s.moveVertical(targetY - 50);
            s.makeVisible();
            
        
        
            
    }
}
}
