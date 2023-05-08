import 'package:get/get.dart';

import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OverviewOfProductController>(
      () => OverviewOfProductController(),
    );
  }
}
