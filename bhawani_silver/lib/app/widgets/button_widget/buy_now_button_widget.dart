import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';
import '../../routes/app_pages.dart';

class BuyNowButtonWidget extends StatelessWidget {
  const BuyNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OverviewOfProductController>();
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(AppColor.orangeColor),
          foregroundColor: MaterialStateProperty.all(
              AppColor.blackColor),
          minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 50))),
      onPressed: () {
        Get.toNamed(Routes.SELECT_ADDRESS, arguments: controller.product);
      },
      child: const Text('Buy Now'),
    );
  }
}
