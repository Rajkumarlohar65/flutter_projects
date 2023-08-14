import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/add_to_cart_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/buy_now_button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductView extends GetView<OverviewOfProductController> {
  const OverviewOfProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = controller.product;

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(product.name),
                  expandedHeight: 400,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 80),
                      child: CachedNetworkImage(imageUrl: product.image),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          const AddToCartButtonWidget(),
                          const SizedBox(height: 8.0),
                          const BuyNowButtonWidget(),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ]),
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
