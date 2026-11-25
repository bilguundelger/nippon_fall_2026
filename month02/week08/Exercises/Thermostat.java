
public class Thermostat {
private int temperature;
public Thermostat() {
    temperature = 22;
// TODO 1: Анхны температур 22 градус байна.
}
// TODO 2: getTemperature гэдэг нэртэй method бичнэ үү
// () -> int
public int getTemperature(){
    return temperature;
}
// TODO 3: increaseTemp гэдэг нэртэй method бичнэ үү
// () -> void
public void increaseTemp(){
    if (temperature <= 30){
        temperature = temperature + 1;
    }
}
// temperature-ийг 1-ээр нэмнэ (хамгийн ихдээ 30 байна).
// TODO 4: decreaseTemp гэдэг нэртэй method бичнэ үү
// () -> void
// temperature-ийг 1-ээр хасна (хамгийн багадаа 16 байна).
public void decreaseTemp(){
    if (temperature >= 16){
        temperature = temperature - 1;
    }
    
}
}
