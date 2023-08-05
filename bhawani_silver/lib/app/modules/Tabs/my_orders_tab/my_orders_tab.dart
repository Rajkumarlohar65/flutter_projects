import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyOrdersTab extends GetView<MyOrdersTabController> {
  const MyOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true, // The app bar will remain visible as the user scrolls
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("My orders", style: TextStyle(color: Colors.grey),),
              background: Container(
                color: Colors.white, // Set background color as per your preference
                child: Center(
                  child: Lottie.asset(
                    'animations/animation1.json', // Replace this with your Lottie animation file path
                    width: 200, // Set the width and height of the animation as per your preference
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: controller.getOrderStream(), // Use the stream to get real-time data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is loading, show a loading indicator
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError || snapshot.data == null) {
                // Handle error or no data case
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Error loading orders'),
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                // If there are no orders, display a message
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('No orders found'),
                  ),
                );
              } else {
                // If data is available, display the orders in a SliverList
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final order = snapshot.data![index];

                      // Extract data from the 'order' map
                      final shippingAddress = order['shippingAddress'];
                      final productDetails = order['productDetails'];
                      // final subtotal = order['subtotal'];
                      // final discount = order['discount'];
                      final total = order['total'];

                      // Create an order card widget
                      return buildOrderCard(
                        orderNumber: index + 1,
                        shippingAddress: shippingAddress,
                        totalAmount: total.toDouble(),
                        productDetails: productDetails,
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Build a custom Order card widget
  Widget buildOrderCard({
    required int orderNumber,
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> productDetails,
    required double totalAmount,
  }) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Order $orderNumber',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Shipping Address'),
            subtitle: Text(
              '${shippingAddress['street']}, ${shippingAddress['city']}, ${shippingAddress['state']}, ${shippingAddress['pinCode']}, ${shippingAddress['country']}',
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
          ListTile(
            title: const Text('Items'),
            subtitle: Text(
              '${productDetails['name']}',
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Total Amount'),
            subtitle: Text('\$${totalAmount.toStringAsFixed(2)}'),
          ),
          const SizedBox(height: 8),
          // You can add more details like order items, status, etc. here
        ],
      ),
    );
  }
}
