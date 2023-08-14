import 'package:BhawaniSilver/app/core/utils/utils.dart';
import 'package:BhawaniSilver/app/data/firebase/firestore/firestore_services.dart';
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_color.dart';
import '../../data/model/product.dart';

class AddToCartButtonWidget extends GetView<OverviewOfProductController> {
  const AddToCartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newController = Get.find<CartTabController>();
    final Product product = controller.product;
    final fireStoreServices = FireStoreServices();

    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.yellowColor),
            foregroundColor: MaterialStateProperty.all(AppColor.blackColor),
            minimumSize:
                MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
          ),
          onPressed: controller.isLoading.value
              ? null
              : () async {
                  try {
                    controller.setLoading(true);
                    final productExists = await fireStoreServices
                        .isProductInCart(product.productId);
                    if (!productExists) {
                      await FireStoreServices.addToCart(product.productId, 1);
                      Utils().showSuccessToast('${product.name} added to cart');
                      newController.calculateCartSubtotal();
                    } else {
                      Utils().showSuccessToast(
                          '${product.name} is already in the cart');
                    }
                  } catch (e) {
                    Utils().showErrorSnackBar("Error", e.toString());
                  } finally {
                    controller.setLoading(false);
                  }
                },
          child: const Text('Add to Cart'),
        ),
      ),
    );
  }
}
