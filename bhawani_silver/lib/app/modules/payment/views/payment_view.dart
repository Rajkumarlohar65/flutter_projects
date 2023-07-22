import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:BhawaniSilver/app/modules/select_address/controllers/select_address_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  final double discount = 50.0;

  @override
  Widget build(BuildContext context) {
    final ctc = Get.find<CartTabController>();
    // Retrieve the selected address data passed from the SelectAddressView
    Address selectedAddress = Get.arguments as Address;
    // Check if OverviewOfProductController is available and has a product
    final myController = Get.isRegistered<OverviewOfProductController>()
        ? Get.find<OverviewOfProductController>()
        : null;

    // Get the list of items from CartController
    final cartController = Get.find<SelectAddressController>();
    final cartItems = cartController.cartData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Shipping Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(selectedAddress.street),
            subtitle: Text(
                '${selectedAddress.city}, ${selectedAddress.state}, ${selectedAddress.pinCode}, ${selectedAddress.country}'),
            // Customize as needed to display other address details.
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Product Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: myController != null
                  ? ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: myController.product.image,
                      ),
                      title: Text(myController.product.name),
                      subtitle: Text(
                        "\$${myController.product.price.toString()}",
                      ),
                      trailing: Text("Q:1"),
                    )
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        final productId =
                            cartItem['product_id'] ?? ''; // Get the product ID
                        final quantity =
                            cartItem['quantity'] ?? 0; // Get the quantity

                        // Add a FutureBuilder here to fetch product data based on the product ID
                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('products')
                              .doc(productId)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Show a loading spinner while fetching data
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              final productData = snapshot.data!.data()
                                  as Map<String, dynamic>?;
                              final productName = productData?['name'] ?? '';
                              final productPrice = productData?['price'] ?? 0;
                              final productImage = productData?['image'] ?? '';
                              final productQuantity =
                                  productData?['quantity'] ?? 0;

                              return ListTile(
                                leading: SizedBox(
                                    width: 56,
                                    child: CachedNetworkImage(
                                      imageUrl: productImage,
                                    )),
                                title: Text(productName),
                                subtitle: Text(
                                  "\$${productPrice.toStringAsFixed(2)}",
                                ),
                                trailing: Text("Q:${quantity}"),
                              );
                            }
                          },
                        );
                      },
                    ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: myController != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal: \$${myController.product.price.toString()}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Discount: \$${discount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(
                          'Total: \$${myController.product.price - discount}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal: \$${ctc.cartSubtotal.value.toString()}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Discount: \$$discount',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(
                          'Total: \$${ctc.cartSubtotal.value - discount}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Implement the payment logic here
              // For example, you can show a success dialog or navigate to a success page
              Get.snackbar('Payment Successful', 'Thank you for your purchase!',
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text('Pay Now'),
          ),
        ),
      ),
    );
  }
}
