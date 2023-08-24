import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/add_to_cart_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/buy_now_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/cache_networkImage_widget.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductViewWeb extends GetView<OverviewOfProductController> {
  const OverviewOfProductViewWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = controller.product;
    return Scaffold(
      body: Obx(
            () =>
            Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      expandedHeight: 60,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      title: SearchBarWidget(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver:
                      SliverToBoxAdapter(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width/3, // Adjust the width as needed
                              height: Get.height/2, // Adjust the height as needed
                              child: CachedNetworkImageWidget(imageUrl: product
                                  .image),
                            ),
                            const SizedBox(width: 16.0),
                            // Add spacing between image and text

                            Expanded(
                              child: Container(
                                height: Get.height,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey, // Customize the outline color
                                    width: 1.0,         // Customize the outline width
                                  ),
                                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          product.description,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: AppColor.greyColor,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        Text(
                                          '₹${product.price}',
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        const SizedBox(
                                          width: 300,
                                          child: Column(
                                            children: [
                                              AddToCartButtonWidget(),
                                              SizedBox(height: 8.0),
                                              BuyNowButtonWidget(),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (controller.isLoading.value)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}