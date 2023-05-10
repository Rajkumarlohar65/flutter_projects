import 'package:bhawani_silver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:get/get.dart';

class CartTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartTabController>(
      () => CartTabController(),
    );
  }
}
