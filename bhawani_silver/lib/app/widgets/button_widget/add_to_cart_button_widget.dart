import 'package:bhawani_silver/app/core/utils/utils.dart';
import 'package:bhawani_silver/app/data/firebase/firestore/firestore_services.dart';
import 'package:bhawani_silver/app/modules/home/controllers/home_controller.dart';
import 'package:bhawani_silver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OverviewOfProductController>();

    return ElevatedButton(
      onPressed: () {
        try{
          FireStoreServices.addCart(controller.productId, 1);
          Utils().showSuccessToast('${controller.name} added to cart');
        }catch(e){
          Utils().showErrorSnackBar("Error", e.toString());
        }
      },
      child: const Text('Add to Cart'),
    );
  }
}
