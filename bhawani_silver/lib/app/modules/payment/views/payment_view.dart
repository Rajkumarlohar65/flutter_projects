import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  final double discount = 50.0;

  @override
  Widget build(BuildContext context) {
    // Retrieve the selected address data passed from the SelectAddressView
    Address selectedAddress = Get.arguments as Address;
    final myController = Get.find<OverviewOfProductController>();
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
            leading: const Icon(Icons.home),
            title: Text(selectedAddress.street),
            subtitle: Text('${selectedAddress.city}, ${selectedAddress.state}, ${selectedAddress.pinCode}, ${selectedAddress.country}'),
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
          //
          Expanded(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: ListTile(
                leading: CachedNetworkImage(imageUrl: myController.product.image,),
                title: Text(myController.product.name),
                subtitle: Text("Rs: ${myController.product.price.toString()}"),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subtotal: \$${myController.product.price.toString()}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Discount: \$${discount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  'Total: \$${myController.product.price - discount}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
