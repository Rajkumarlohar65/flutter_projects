import 'package:bhawani_silver/app/core/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;
  var uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> onInit() async {
    productStream = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .snapshots();

    super.onInit();
  }
}
