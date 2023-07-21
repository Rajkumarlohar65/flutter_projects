import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';
import '../../routes/app_pages.dart';

class BuyNowButtonWidget extends StatelessWidget {
  const BuyNowButtonWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(AppColor.orangeColor),
          foregroundColor: MaterialStateProperty.all(
              AppColor.blackColor),
          minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 50))),
      onPressed: () {
        Get.toNamed(Routes.ADDRESS);
      },
      child: const Text('Buy Now'),
    );
  }
}
