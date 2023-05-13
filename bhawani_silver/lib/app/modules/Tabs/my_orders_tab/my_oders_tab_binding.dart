import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:get/get.dart';

class MyOrdersTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrdersTabController>(
      () => MyOrdersTabController(),
    );
  }
}
