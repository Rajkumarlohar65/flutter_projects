import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utils/utils.dart';

class FireStoreServices {

  static saveUser({required name, required email, required uid}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'name': name, 'email': email});
  }

  // static Future<void> saveOrder(String productId, int totalPrice) async {
  //   final orderRef = FirebaseFirestore.instance.collection('orders').doc();
  //   final userId = AuthenticationHelper().currentUser!.uid;
  //   final orderDate = DateTime.now();
  //
  //   await orderRef.set({
  //     'order_id': orderRef.id,
  //     'user_id': userId,
  //     'product_id': productId,
  //     'order_date': orderDate,
  //     'total_price': totalPrice,
  //   });
  // }

  static addToCart(String productId, int quantity) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc().set({'product_id': productId, 'quantity': quantity});
  }


  Future<bool> isProductInCart(String productId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .where('product_id', isEqualTo: productId)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  static incrementCartQuantity(String cartItemId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(cartItemId)
        .update({'quantity': FieldValue.increment(1)})
        .then((value) {})
        .catchError((error) {
      Utils().showErrorSnackBar("Error", error.toString());
    });
  }

  static decrementCartQuantity(String cartItemId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(cartItemId)
        .update({'quantity': FieldValue.increment(-1)})
        .then((value) {})
        .catchError((error) {
      Utils().showErrorSnackBar("Error", error.toString());
    });
  }

  static deleteFromCart(String cartItemId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(cartItemId)
        .delete();
    }
  }



  // static Future<void> saveOrderItems(String productId, int quantity) async {
  //   final orderRef = FirebaseFirestore.instance.collection('order_items_id').doc();
  //   final orderIdRef = FirebaseFirestore.instance.collection('orders').doc();
  //   final userId = AuthenticationHelper().currentUser!.uid;
  //
  //   await orderRef.set({
  //     'order_item_id': orderRef.id,
  //     'order_id': orderIdRef.id,
  //     'product_id': productId,
  //     'quantity': quantity,
  //   });
  // }