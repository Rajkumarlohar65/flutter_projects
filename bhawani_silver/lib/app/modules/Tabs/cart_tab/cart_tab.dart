import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/proceed_to_buy_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/cartCardWidget.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../core/values/app_color.dart';

class CartTab extends GetView<CartTabController> {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cartItems.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/animations/empty_cart.json',
                  width: 300,
                  height: 300,
                  reverse: true,
                ),
              ),
              !AuthenticationHelper().isUserLoggedIN()
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColor.yellowColor),
                                foregroundColor: MaterialStateProperty.all(Colors
                                    .black), // You can adjust the text color
                              ),
                              child: const Text('Login to your account'),
                            )),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: const Text('Sign up now'),
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        );
      }
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      final subtotal = controller.cartSubtotal.value;
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Subtotal: ₹',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  subtotal.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ]),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate:
                  _BuyButtonHeaderDelegate(cartDocs: controller.cartItems),
            ),
            SliverPadding(
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final cartItem = controller.cartItems[index];
                  final productImageUrl = cartItem['image'];
                  final quantity = cartItem['quantity'];
                  final productId = cartItem['product_id'];
                  final productPrice = cartItem['product_price'];
                  final productName = cartItem['product_name'];

                  return CartCardWidget(
                    productImageUrl: productImageUrl,
                    quantity: quantity,
                    productId: productId,
                    productPrice: productPrice,
                    productName: productName,
                  );
                }, childCount: controller.cartItems.length),
              ),
              padding: const EdgeInsets.only(),
            )
          ],
        ),
      );
    });
  }
}

class _BuyButtonHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<dynamic> cartDocs; // Change the type to List<dynamic>

  _BuyButtonHeaderDelegate({required this.cartDocs});

  @override
  double get minExtent => 60.0;
  @override
  double get maxExtent => 60.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ProceedToBuyButtonWidget(cartDocs);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
