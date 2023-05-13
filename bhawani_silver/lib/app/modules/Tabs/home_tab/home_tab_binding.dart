import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:get/get.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTabController>(
      () => HomeTabController(),
    );
  }
}
