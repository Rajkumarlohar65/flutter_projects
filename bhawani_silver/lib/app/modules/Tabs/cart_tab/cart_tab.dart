import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/values/app_color.dart';
import '../../../routes/app_pages.dart';

class CartTab extends GetView<CartTabController> {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDarkTheme ? Colors.black : AppColor.cardBackgroundColor,
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
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    backgroundColor: isDarkTheme
                        ? Colors.black
                        : AppColor.cardBackgroundColor,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10, top: 35, bottom: 0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.SELECT_ADDRESS,
                                arguments: cartDocs);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.yellowColor),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColor.blackColor),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(double.infinity, 40))),
                          child: const Text('Proceed to Buy'),
                        ),
                      ),
                      background: Column(
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
                                  Text(
                                    'Subtotal: ₹${subtotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
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

                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: CachedNetworkImage(
                                                imageUrl: productImageUrl,
                                                fit: BoxFit.cover,
                                                placeholder:
                                                    (context, imageUrl) {
                                                  return const Center(
                                                    child: SpinKitFadingCircle(
                                                      size: 20,
                                                      color: AppColor.blueColor,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 40,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      if (quantity > 1) {
                                                        controller
                                                            .decrementQuantity(
                                                                cart.id);
                                                      }
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                        foregroundColor: isDarkTheme
                                                            ? AppColor
                                                                .whiteColor
                                                            : AppColor
                                                                .blackColor // Text color for dark mode
                                                        ),
                                                    child: const Text("-"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '$quantity',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      controller
                                                          .incrementQuantity(
                                                              cart.id);
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                        foregroundColor:
                                                            isDarkTheme
                                                                ? AppColor
                                                                    .whiteColor
                                                                : AppColor
                                                                    .blackColor),
                                                    child: const Text('+'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Price: ₹${productPrice.toStringAsFixed(2)}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.greyColor),
                                              ),
                                              const SizedBox(height: 56),
                                              SizedBox(
                                                width: double.infinity,
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    controller
                                                        .deleteItem(cart.id);
                                                  },
                                                  style: OutlinedButton.styleFrom(
                                                      foregroundColor:
                                                          isDarkTheme
                                                              ? AppColor
                                                                  .whiteColor
                                                              : AppColor
                                                                  .blackColor),
                                                  child: const Text('Delete'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
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
