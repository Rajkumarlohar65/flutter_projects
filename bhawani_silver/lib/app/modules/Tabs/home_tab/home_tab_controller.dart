import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initializeProductStream();
  }

  Future<void> _initializeProductStream() async {
    productStream = FirebaseFirestore.instance.collection('products').snapshots();
  }

}
