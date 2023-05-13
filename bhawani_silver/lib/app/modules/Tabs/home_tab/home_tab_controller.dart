import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;

  @override
  Future<void> onInit() async {
    super.onInit();
    productStream =
        FirebaseFirestore.instance.collection('products').snapshots();
  }

}
