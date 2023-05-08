import 'package:get/get.dart';

class OverviewOfProductController extends GetxController {

  late final Map<String, dynamic> arguments;
  late final String name;
  late final int price;
  late final String description;
  late final String image;
  late final String productId;

  @override
  void onInit() {
    arguments = Get.arguments;
    name = arguments['name'];
    price = arguments['price'];
    description = arguments['description'];
    image = arguments['image'];
    productId = arguments['productId'];
  }

}
