import 'package:BhawaniSilver/app/widgets/dialog_box_widget/cancel_order_dialog.dart';
import 'package:flutter/material.dart';

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
            subtitle: Text('₹${totalAmount.toStringAsFixed(2)}'),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CancelOrderDialog(onDelete: onDelete);
                    },
                  );
                },
                child: const Text("Cancel Order"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
