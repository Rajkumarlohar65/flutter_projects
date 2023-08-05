import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersTabController extends GetxController {
  // Stream to listen for real-time changes in orders
  Stream<List<Map<String, dynamic>>> getOrderStream() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) => document.data() as Map<String, dynamic>).toList());
  }
}
