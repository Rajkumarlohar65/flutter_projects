import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class  HomeTabController extends GetxController {
  late Stream<QuerySnapshot> productsStream;

  @override
  void onInit() {
    super.onInit();
    productsStream = FirebaseFirestore.instance.collection('products').snapshots();
  }

}
