import 'package:bhawani_silver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartDocs.length,
                    itemBuilder: (context, index) {
                      final productId = cartDocs[index]['product_id'] ?? '';
                      final quantity = cartDocs[index]['quantity'] ?? '';
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('products')
                            .doc(productId)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No data available'),
                            );
                          } else {
                            final productData =
                                snapshot.data!.data() as Map<String, dynamic>?;
                            final productName = productData?['name'] ?? '';
                            final productPrice = productData?['price'] ?? '';
                            final productImageUrl = productData?['image'] ?? '';
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: CachedNetworkImage(
                                        imageUrl: productImageUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (context, imageUrl){
                                          return  const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(productName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          const SizedBox(height: 8),
                                          Text(
                                              'Price: \$${productPrice.toStringAsFixed(2)}'),
                                          const SizedBox(height: 8),
                                          Text('Quantity: $quantity'),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(controller.uid)
                                            .collection('cart')
                                            .doc(cartDocs[index].id)
                                            .delete();
                                      },
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
                if (cartSnapShot.connectionState == ConnectionState.waiting)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          }
        }
      },
    );
  }
}
