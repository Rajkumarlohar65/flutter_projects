import 'package:BhawaniSilver/app/data/firebase/firestore/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var cartSubtotal = 0.0.obs;

  @override
  Future<void> onInit() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      uid = currentUser.uid;
      productStream = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cart')
          .snapshots();

      await calculateCartSubtotal();
    }

    super.onInit();
  }

  // Method to increment the quantity
  Future<void> incrementQuantity(String cartItemId) async {
    await FireStoreServices.incrementCartQuantity(cartItemId);
    await calculateCartSubtotal();
  }

  // Method to decrement the quantity
  Future<void> decrementQuantity(String cartItemId) async {
    await FireStoreServices.decrementCartQuantity(cartItemId);
    await calculateCartSubtotal();
  }

  Future<void> deleteItem(String cartItemId) async {
    await FireStoreServices.deleteFromCart(cartItemId);
    await calculateCartSubtotal();
  }

  static Future<double> getPriceById(String productId) async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();
    final data = snapshot.data() as Map<String, dynamic>?; // Explicitly cast to Map<String, dynamic>
    if (data != null) {
      final price = data['price'];
      if (price is num) {
        return price.toDouble();
      }
    }
    return 0.0; // Return 0 if the product with the given ID is not found or if the price is not a valid number
  }

  Future<void> calculateCartSubtotal() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .get();

    double subtotal = 0.0;

    for (final cartItem in cartSnapshot.docs) {
      final productId = (cartItem.data() as Map<String, dynamic>?)?['product_id'];
      final quantity = (cartItem.data() as Map<String, dynamic>?)?['quantity'];

      final double price = await getPriceById(productId);
      subtotal += price * quantity;
    }

    cartSubtotal.value = subtotal;
  }
}
