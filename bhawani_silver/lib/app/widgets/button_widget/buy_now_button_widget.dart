import 'package:flutter/material.dart';

import '../../core/values/app_color.dart';

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
        // TODO: Implement "Add to Cart" functionality.
      },
      child: const Text('Buy Now'),
    );
  }
}
