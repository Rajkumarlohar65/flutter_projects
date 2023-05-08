import 'package:bhawani_silver/app/widgets/button_widget/add_to_cart_button_widget.dart';
import 'package:bhawani_silver/app/widgets/button_widget/buy_now_button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductView extends GetView<OverviewOfProductController> {
  const OverviewOfProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(imageUrl: controller.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    controller.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    controller.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '\$${controller.price}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const AddToCartButtonWidget(),
                  const SizedBox(height: 8.0),
                  const BuyNowButtonWidget()

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
