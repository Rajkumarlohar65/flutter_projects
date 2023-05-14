import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';

class CartTab extends GetView<CartTabController> {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.productStream,
      builder: (context, cartSnapShot) {
        if (cartSnapShot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final cartDocs = cartSnapShot.data!.docs;
          if (cartDocs.isEmpty) {
            return const Center(
              child: Text('No items in cart.'),
            );
          } else {
            double subtotal = 0;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform checkout action
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartDocs.length,
                    itemBuilder: (context, index) {
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
                            final productData =
                                snapshot.data!.data() as Map<String, dynamic>?;
                            final productName = productData?['name'] ?? '';
                            final productPrice = productData?['price'] ?? '';
                            final productImageUrl = productData?['image'] ?? '';

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            placeholder: (context, imageUrl) {
                                              return const Center(
                                                child: SpinKitFadingCircle(
                                                  size: 20,
                                                  color: AppColor.blueColor,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                if (quantity > 1) {
                                                  controller.decrementQuantity(
                                                      cart.id);
                                                }
                                              },
                                            ),
                                            Text(
                                              '$quantity',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                controller
                                                    .incrementQuantity(cart.id);
                                              },
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
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Price: \$${productPrice.toStringAsFixed(2)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          const SizedBox(height: 45),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  controller
                                                      .deleteItem(cart.id);
                                                },
                                                child: const Text('Remove')),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }
      },
    );
  }
}
