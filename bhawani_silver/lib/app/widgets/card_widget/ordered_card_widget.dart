import 'package:BhawaniSilver/app/widgets/dialog_box_widget/cancel_order_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/values/app_color.dart';

class OrderCardWidget extends StatelessWidget {
  final BuildContext context;
  final int orderNumber;
  final Map<String, dynamic> shippingAddress;
  final Map<String, dynamic> productDetails;
  final double totalAmount;
  final VoidCallback onDelete;

  const OrderCardWidget({
    required this.context,
    required this.orderNumber,
    required this.shippingAddress,
    required this.productDetails,
    required this.totalAmount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              color: isDarkTheme ? AppColor.greyColor : AppColor.cardBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      'Order $orderNumber',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? AppColor.blackColor : AppColor.blackColor
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 80,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CancelOrderDialog(onDelete: onDelete);
                            },
                          );
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: isDarkTheme ? AppColor.lightBlack : AppColor.whiteColor,
                            border: Border.all(
                              color: isDarkTheme ? AppColor.lightBlack : AppColor.cardBackgroundColor, // Set the border color here
                              width: 1.0, // Set the border width here
                            ),
                            borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                          ),
                          child: Center(child: Text("Cancel", style: TextStyle(color: isDarkTheme ? AppColor.whiteColor : AppColor.blackColor),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Divider(),
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
            subtitle: Text('₹${totalAmount.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
