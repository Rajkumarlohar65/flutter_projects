import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/add_to_cart_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/buy_now_button_widget.dart';
import 'package:BhawaniSilver/app/widgets/cache_networkImage_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../data/model/product.dart';
import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductView
    extends GetView<OverviewOfProductController> {
  const OverviewOfProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OverviewOfProductController controller = Get.put(OverviewOfProductController());
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
                  backgroundColor: AppColor.blueGrey,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            _showImageDialog(context, product.image);
                          },
                          child: SizedBox(
                              width: 300,
                              height: 300,
                              child: CachedNetworkImageWidget(
                                  imageUrl: product.image)),
                        ),
                      ],
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
  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            height: MediaQuery.of(context).size.height , // Set the height to half of the screen height
            width: MediaQuery.of(context).size.width,
            child: Center(
              child:  PhotoView(
                imageProvider:  CachedNetworkImageProvider(imageUrl),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent, // Transparent background
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: 2.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

