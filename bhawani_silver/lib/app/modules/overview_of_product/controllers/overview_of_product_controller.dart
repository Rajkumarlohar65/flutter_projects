import 'package:get/get.dart';

import '../../../data/model/product.dart';

class OverviewOfProductController extends GetxController {
  Rx<bool> isLoading = false.obs;
  late final Product product;

  @override
  void onInit() {
    product = Get.arguments;
    super.onInit();
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }

}
