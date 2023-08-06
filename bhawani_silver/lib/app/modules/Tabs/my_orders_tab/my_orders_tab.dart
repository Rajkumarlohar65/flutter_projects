import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyOrdersTab extends GetView<MyOrdersTabController> {
  const MyOrdersTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "My orders",
                style: TextStyle(color: Colors.grey),
              ),
              background: Container(
                color: Colors.white,
                child: Center(
                  child: Lottie.asset(
                    'animations/delivery_boy.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: controller.getOrderStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError || snapshot.data == null) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Error loading orders'),
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      children: [
                        Lottie.asset(
                          'animations/empty_orders.json',
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        const Text("No Order found"),
                      ],
                    ),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final order = snapshot.data![index];
                      final shippingAddress = order['shippingAddress'];
                      final productDetails = order['productDetails'];
                      final total = order['total'];
                      final orderId = order['orderId'];

                      return buildOrderCard(
                        orderNumber: index + 1,
                        shippingAddress: shippingAddress,
                        totalAmount: total.toDouble(),
                        productDetails: productDetails,
                        onDelete: () => _deleteOrder(orderId),
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

  Widget buildOrderCard({
    required int orderNumber,
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> productDetails,
    required double totalAmount,
    required VoidCallback onDelete,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onDelete,
                child: const Text("Cancel Order"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteOrder(String orderId) {
    // Your code to delete the order from Firebase goes here
    // You can use the controller or any other method to delete the order
    final uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .doc(orderId)
        .delete()
        .then((_) {
      // Order successfully deleted
      print('Order deleted successfully');
    }).catchError((error) {
      // Failed to delete the order
      print('Error deleting order: $error');
    });
  }
}
