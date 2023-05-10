import 'package:get/get.dart';

import '../../../data/model/product.dart';

class SearchResultsController extends GetxController {
  late final Product product;

  @override
  void onInit() {
    product = Get.arguments;
    super.onInit();
  }
}
