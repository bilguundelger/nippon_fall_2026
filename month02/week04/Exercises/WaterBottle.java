public class WaterBottle {
    private int waterMl;
    private int capacityMl;

    public WaterBottle(int capacity) {
        // TODO 1: Хэрэв capacity > 0 бол capacityMl = capacity болгоно, үгүй бол 500 болгоно.
        // Анх сав хоосон байх тул waterMl = 0 байна.
        if (capacity > 0) {
            capacityMl = capacity;
        } else {
            capacityMl = 500;
        }
        waterMl = 0;
    }

    // TODO 2: getWaterMl гэдэг нэртэй одоогийн усны хэмжээг буцаадаг method бичнэ үү
    // () -> int
    public int getWaterMl() {
        return waterMl;
    }

    
    public void fill(int amount) {
        if (amount > 0) {
            if (waterMl + amount <= capacityMl) {
                waterMl = waterMl + amount;
            } else {
                waterMl = capacityMl;
            }
        }
    }

    
    public void drink(int amount) {
        if (amount > 0) {
            if (waterMl - amount >= 0) {
                waterMl = waterMl - amount;
            } else {
                waterMl = 0;
            }
        }
    }
}