import 'package:BhawaniSilver/app/core/utils/utils.dart';
import 'package:BhawaniSilver/app/data/firebase/firestore/firestore_services.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';

class AddToCartButtonWidget extends GetView<OverviewOfProductController> {
  const AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = controller.product;
    final fireStoreServices = FireStoreServices();

    return ElevatedButton(
      onPressed: () async{
      try {
        final productExists = await fireStoreServices.isProductInCart(product.productId);
        if (!productExists) {
          await FireStoreServices.addToCart(product.productId, 1);
          Utils().showSuccessToast('${product.name} added to cart');
        } else {
          Utils().showSuccessToast('${product.name} is already in the cart');
        }
      } catch (e) {
        Utils().showErrorSnackBar("Error", e.toString());
      }
    },
      child: const Text('Add to Cart'),
    );
  }
}
