import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartTabController extends GetxController {
  final storage = GetStorage();
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  RxDouble cartSubtotal = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
    calculateCartSubtotal();
  }

  void readData() {
    cartItems.assignAll(storage.read<List>('cartItems')?.cast<Map<String, dynamic>>() ?? []);
    print("Read data: $cartItems");
  }

  void incrementQuantity(int index) {
    cartItems[index]['quantity']++;
    storage.write('cartItems', cartItems.toList()); // Convert to List before writing
    calculateCartSubtotal();
    readData();
  }

  void decrementQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      storage.write('cartItems', cartItems.toList()); // Convert to List before writing
      calculateCartSubtotal();
      readData();
    }
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    storage.write('cartItems', cartItems.toList()); // Convert to List before writing
    calculateCartSubtotal();
    readData();
  }

  void calculateCartSubtotal() {
    double subtotal = 0.0;
    for (final cartItem in cartItems) {
      final productId = cartItem['product_id'];
      final quantity = cartItem['quantity'];
      final double price = cartItem['product_price'].toDouble();

      subtotal += price * quantity;
    }
    cartSubtotal.value = subtotal;
  }
}
