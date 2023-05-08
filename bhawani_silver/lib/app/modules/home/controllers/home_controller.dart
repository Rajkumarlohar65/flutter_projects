
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  late Stream<QuerySnapshot> productsStream;
  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    productsStream = FirebaseFirestore.instance.collection('products').snapshots();
  }


  void changeTabIndex(int index){
    currentIndex = index;
    update();
  }

}

