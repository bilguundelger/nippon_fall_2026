
public class Product {
private String name;
private double price;
public Product(String productName, double productPrice){
    name = productName;
    if (price < 0){
        price = 0.0;
    }else{
        price = productPrice;
    }
}
public String getName(){
    return name;
}
public double getPrice(){
    return price;
}
}