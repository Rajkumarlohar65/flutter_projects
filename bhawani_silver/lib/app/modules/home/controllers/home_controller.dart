import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index){
    currentIndex = index;
    update();
  }

}
