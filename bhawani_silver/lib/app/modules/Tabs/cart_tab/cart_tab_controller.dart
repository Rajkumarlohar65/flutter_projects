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

  void incrementQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item['product_id'] == productId);
    if (index != -1) {
      cartItems[index]['quantity']++;
      storage.write('cartItems', cartItems.toList());
      calculateCartSubtotal();
      readData();
    }
  }

  void decrementQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item['product_id'] == productId);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      storage.write('cartItems', cartItems.toList());
      calculateCartSubtotal();
      readData();
    }
  }

  void deleteItem(String productId) {
    cartItems.removeWhere((item) => item['product_id'] == productId);
    storage.write('cartItems', cartItems.toList());
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
