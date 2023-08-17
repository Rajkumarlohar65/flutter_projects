import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late final Stream<QuerySnapshot> productStream;
  late final Stream<QuerySnapshot> bannerStream;
  RxInt currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initializeProductStream();
    await _initializeBannerStream();
  }

  Future<void> _initializeProductStream() async {
    productStream = FirebaseFirestore.instance.collection('products').snapshots();
  }

  Future<void> _initializeBannerStream() async {
    bannerStream = FirebaseFirestore.instance.collection('banners').snapshots();
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

}
