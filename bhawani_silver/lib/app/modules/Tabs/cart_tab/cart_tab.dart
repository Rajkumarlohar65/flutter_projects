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
import 'package:lottie/lottie.dart';

import '../../../core/values/app_color.dart';

class CartTab extends GetView<CartTabController> {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!AuthenticationHelper().isUserLoggedIN()) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
              'assets/animations/empty_cart.json', // Replace this with your Lottie animation file path
              width:
              300, // Set the width and height of the animation as per your preference
              height: 300,
              reverse: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColor.yellowColor),
                        foregroundColor: MaterialStateProperty.all(Colors.black), // You can adjust the text color
                      ),
                      child: const Text('Login to your account'),
                    )

                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.SIGNUP);
                    },
                    child: const Text('Sign up now'),
                  )

                ],
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.productStream,
        builder: (context, cartSnapShot) {
          if (cartSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final cartDocs = cartSnapShot.data!.docs;
            if (cartDocs.isEmpty) {
              return Center(
                child: Lottie.asset(
                    'assets/animations/empty_cart.json', // Replace this with your Lottie animation file path
                    width:
                        300, // Set the width and height of the animation as per your preference
                    height: 300,
                    reverse: true),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    expandedHeight: 60,
                    pinned: true,
                    title: SearchBarWidget(),
                  ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Subtotal: ₹',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
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
                                ));
                          })
                        ])
                  ])),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _BuyButtonHeaderDelegate(cartDocs: cartDocs),
                  ),
                  SliverPadding(
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final cart = cartDocs[index];
                        final productId = cart['product_id'] ?? '';
                        final quantity = cart['quantity'] ?? '';
                        return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('products')
                                .doc(productId)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                if (index == 0) {
                                  return const SizedBox(
                                    child: SpinKitFadingCircle(
                                      size: 20,
                                      color: AppColor.blueColor,
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              } else {
                                final productData = snapshot.data!.data()
                                    as Map<String, dynamic>?;
                                final productName = productData?['name'] ?? '';
                                final productPrice =
                                    productData?['price'] ?? '';
                                final productImageUrl =
                                    productData?['image'] ?? '';

                                return CartCardWidget(
                                    productImageUrl: productImageUrl,
                                    quantity: quantity,
                                    id: cart.id,
                                    productPrice: productPrice,
                                    productName: productName);
                              }
                            });
                      }, childCount: cartDocs.length),
                    ),
                    padding: const EdgeInsets.only(),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}

class _BuyButtonHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<QueryDocumentSnapshot> cartDocs;

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
