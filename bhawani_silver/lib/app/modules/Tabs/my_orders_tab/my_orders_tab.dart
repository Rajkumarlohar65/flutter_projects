import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/ordered_card_widget.dart';

class MyOrdersTab extends GetView<MyOrdersTabController> {
  const MyOrdersTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                return SliverAppBar(
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
                );
              }
            },
          ),
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: controller.getOrderStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final order = snapshot.data![index];
                        final shippingAddress = order['shippingAddress'];
                        final productDetails = order['productDetails'];
                        final total = order['total'];
                        final orderId = order['orderId'];

                        return OrderCardWidget(
                            context: context,
                            orderNumber: index + 1,
                            shippingAddress: shippingAddress,
                            productDetails: productDetails,
                            totalAmount: total.toDouble(),
                            onDelete: () => controller.deleteOrder(orderId));
                      },
                      childCount: snapshot.data!.length,
                    ),
                  );
                }
              }
              return SliverList(delegate: SliverChildListDelegate([]));
            },
          ),
        ],
      ),
    );
  }
}
