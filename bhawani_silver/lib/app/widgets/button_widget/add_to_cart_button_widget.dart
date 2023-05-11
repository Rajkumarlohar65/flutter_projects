import 'package:bhawani_silver/app/core/utils/utils.dart';
import 'package:bhawani_silver/app/data/firebase/firestore/firestore_services.dart';
import 'package:bhawani_silver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';

class AddToCartButtonWidget extends GetView<OverviewOfProductController> {
  const AddToCartButtonWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final Product product = controller.product;

    return ElevatedButton(
      onPressed: () async{
        try {
          await FireStoreServices.addCart(product.productId, 1);
          Utils().showSuccessToast('${product.name} added to cart');
        } catch (e) {
          Utils().showErrorSnackBar("Error", e.toString());
        }
      },
      child: const Text('Add to Cart'),
    );
  }
}
