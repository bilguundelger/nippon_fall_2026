public class CoffeeMachine {
    private int waterMl;
    private int beansGrams;
    private int cupsMade;
    public CoffeeMachine(int initialWater, int initialBeans){
        if (initialWater > 0){
            waterMl = initialWater;
        }else {
            waterMl = 0;
        }
        if (initialBeans > 0){
            beansGrams = initialBeans;
        }else {
            beansGrams = 0;
        }
        cupsMade = 0;
    }   
    public int getWaterMl(){
        return waterMl;
    }

    public int getBeansGrams(){
        return beansGrams;
    }

    public int getCupsMade(){
        return cupsMade;
    }

    public void refill(int water, int beans){
        if (water > 0){
            waterMl = waterMl + water;
        }
        if (beans > 0){
            beansGrams = beansGrams + beans;
        }
    }

    public boolean makeEspresso(){
        if (waterMl >= 50 && beansGrams >= 15) {
            waterMl = waterMl - 50;
            beansGrams = beansGrams - 15;
            cupsMade = cupsMade + 1;
            return true;
        }
        return false;
    }
}


