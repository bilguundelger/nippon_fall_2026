

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
public class ShoppingCartTest {
@Test
public void testAddProductsAndTotal() {
ShoppingCart cart = new ShoppingCart();
assertTrue(cart.addProduct(new Product("Apple", 2.5)));
assertTrue(cart.addProduct(new Product("Milk", 3.5)));
assertEquals(2, cart.getItemCount());
assertEquals(6.0, cart.getTotalPrice(), 0.001);
}

@Test
public void testCartCapacityLimitIs5() {
// TODO: 5 бараа нэмсний дараа 6 дахь бараа нэмэхэд false буцааж,
//тоо 5 хэвээр үлдэхийг шалгана уу
}
@Test
public void testNullProductRejected() {
// TODO: null дамжуулахад false буцааж count нэмэгдэхгүй байгааг
//шалгана уу
}
}