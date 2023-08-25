import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersTabController extends GetxController {
  // Stream to listen for real-time changes in orders
  Stream<List<Map<String, dynamic>>> getOrderStream() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('orders')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((document) => document.data()).toList());
    } else {
      // Return an empty stream if the user is not logged in
      return Stream.value([]);
    }
  }

  void deleteOrder(String orderId) {
    // Your code to delete the order from Firebase goes here
    // You can use the controller or any other method to delete the order
    final uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .doc(orderId)
        .delete()
        .then((_) {
      // Order successfully deleted
      print('Order deleted successfully');
    }).catchError((error) {
      // Failed to delete the order
      print('Error deleting order: $error');
    });
  }

}
