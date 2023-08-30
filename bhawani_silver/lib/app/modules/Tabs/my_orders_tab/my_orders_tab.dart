import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/ordered_card_widget.dart';

import '../../../core/values/app_color.dart';
import '../../overview_of_product/controllers/overview_of_product_controller.dart';

class MyOrdersTab extends GetView<MyOrdersTabController> {
  const MyOrdersTab({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    if (!AuthenticationHelper().isUserLoggedIN()) {
      // User is not logged in, show login button or view
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                  'assets/animations/empty_orders.json', // Replace this with your Lottie animation file path
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
                          Get.toNamed(Routes.LOGIN);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColor.yellowColor),
                          foregroundColor: MaterialStateProperty.all(
                              Colors.black), // You can adjust the text color
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
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: isDarkTheme ? null : AppColor.whiteColor,
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
                          'assets/animations/empty_orders.json',
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
                return SliverPadding(
                  padding: const EdgeInsets.only(),
                  sliver: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: controller.getOrderStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.data != null &&
                            snapshot.data!.isNotEmpty) {
                          final myController =
                              Get.isRegistered<OverviewOfProductController>()
                                  ? Get.find<OverviewOfProductController>()
                                  : null;
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final order = snapshot.data![index];
                                final shippingAddress =
                                    order['shippingAddress'];
                                final productDetails = order['productDetails'];
                                final total = order['total'];
                                final orderId = order['orderId'];

                                // Access the 'items' key when myController is null, otherwise use the 'productDetails' value
                                final orderProductDetails = myController == null
                                    ? order['productDetails']['items']
                                    : order['productDetails'];

                                return OrderCardWidget(
                                    context: context,
                                    orderNumber: index + 1,
                                    shippingAddress: shippingAddress,
                                    productDetails: productDetails,
                                    totalAmount: total.toDouble(),
                                    onDelete: () =>
                                        controller.deleteOrder(orderId));
                              },
                              childCount: snapshot.data!.length,
                            ),
                          );
                        }
                      }
                      return SliverList(delegate: SliverChildListDelegate([]));
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
