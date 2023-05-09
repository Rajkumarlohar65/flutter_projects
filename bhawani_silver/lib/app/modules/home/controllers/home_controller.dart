import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Rx<Stream<QuerySnapshot>> productsStream = Rx<Stream<QuerySnapshot>>(
      FirebaseFirestore.instance.collection('products').snapshots());
  int currentIndex = 0;
  bool loadedData = false;

  @override
  void onInit() {
    super.onInit();

    // Fetch data only once using Ever
    ever(productsStream, (snapshot) {
      if (!loadedData) {
        loadedData = true;
        update();
      }
    });
  }


  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
