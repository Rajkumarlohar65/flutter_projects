import 'package:bhawani_silver/app/modules/Tabs/category_tab/category_tab_controller.dart';
import 'package:get/get.dart';

class CategoryTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryTabController>(
      () => CategoryTabController(),
    );
  }
}
