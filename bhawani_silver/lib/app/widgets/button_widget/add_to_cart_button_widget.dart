import 'package:BhawaniSilver/app/core/utils/utils.dart';
import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/values/app_color.dart';
import '../../data/model/product.dart';

class AddToCartButtonWidget extends GetView<OverviewOfProductController> {
  const AddToCartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OverviewOfProductController controller = Get.put(OverviewOfProductController());
    final Product product = controller.product as Product;
    final storage = GetStorage();

    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.yellowColor),
            foregroundColor: MaterialStateProperty.all(AppColor.blackColor),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50)),
          ),
          onPressed: controller.isLoading.value
              ? null
              : () async {
            try {
              controller.setLoading(true);
              final cartItems = storage.read<List>('cartItems') ?? [];

              final itemIndex = cartItems.indexWhere(
                      (item) => item['product_id'] == product.productId);

              if (itemIndex == -1) {
                cartItems.add({
                  'product_id': product.productId,
                  'product_name': product.name,
                  'product_price': product.price,
                  'image': product.image,
                  'quantity': 1,
                });
                storage.write('cartItems', cartItems);
                CartTabController newController =
                Get.put(CartTabController());
                Utils()
                    .showSuccessToast('${product.name} added to cart');
                newController.calculateCartSubtotal();
                Get.offAllNamed(Routes.HOME);
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
