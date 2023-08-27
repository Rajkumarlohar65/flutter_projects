import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/widgets/cache_networkImage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/values/app_color.dart';

class CartCardWidget extends StatelessWidget {
  final String productImageUrl;
  final int quantity;
  final String productId;
  final int productPrice;
  final String productName;
  const CartCardWidget(
      {super.key,
      required this.productImageUrl,
      required this.quantity,
      required this.productId,
      required this.productPrice,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<CartTabController>();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImageWidget(
                    imageUrl: productImageUrl,
                  )
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDarkTheme
                          ? AppColor.lightBlack
                          : AppColor
                              .backgroundColor, // Set the border color here
                      width: 1.0, // Set the border width here
                    ),
                    borderRadius:
                        BorderRadius.circular(5), // Adjust the radius as needed
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity > 1) {
                            controller.decrementQuantity(productId);
                          } else {
                            controller.deleteItem(productId);
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                              color: isDarkTheme
                                  ? AppColor.lightBlack
                                  : AppColor.backgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(
                                      5)) // Adjust the radius as needed
                              ),
                          child: quantity > 1
                              ? const Icon(Icons.remove)
                              : const Icon(Icons.delete_outline),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$quantity',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.incrementQuantity(productId);
                        },
                        child: Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                              color: isDarkTheme
                                  ? AppColor.lightBlack
                                  : AppColor.backgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(
                                      5)) // Adjust the radius as needed
                              ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: ₹${productPrice.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.greyColor),
                  ),
                  const SizedBox(height: 64),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: InkWell(
                          onTap: () {
                            controller.deleteItem(productId);
                          },
                          child: Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isDarkTheme
                                    ? AppColor.greyColor
                                    : AppColor
                                        .backgroundColor, // Set the border color here
                                width: 1.0, // Set the border width here
                              ),
                              borderRadius: BorderRadius.circular(
                                  5), // Adjust the radius as needed
                            ),
                            child: const Center(child: Text('Delete')),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isDarkTheme
                                    ? AppColor.greyColor
                                    : AppColor
                                        .backgroundColor, // Set the border color here
                                width: 1.0, // Set the border width here
                              ),
                              borderRadius: BorderRadius.circular(
                                  5), // Adjust the radius as needed
                            ),
                            child: const Center(child: Text('Save for later')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
