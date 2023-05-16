import 'package:cloud_firestore/cloud_firestore.dart';;
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;
  RxInt currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    await _initializeProductStream();

    super.onInit();
  }

  Future<void> _initializeProductStream() async {
    productStream = FirebaseFirestore.instance.collection('products').snapshots();
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

}
