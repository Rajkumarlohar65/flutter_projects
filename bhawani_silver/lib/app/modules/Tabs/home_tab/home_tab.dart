import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/dialog_box_widget/image_dialog_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/values/app_color.dart';
import '../../../data/model/product.dart';

class HomeTab extends GetView<HomeTabController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.productStream,
        builder: (context, productSnapShot) {
          if (productSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!productSnapShot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            final productDocs = productSnapShot.data!.docs;
            final products =
                productDocs.map((doc) => Product.fromSnapshot(doc)).toList();
            return ListView.separated(
              itemCount: productDocs.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.OVERVIEW_OF_PRODUCT, arguments: product);
                  },
                  child: SizedBox(
                    height: 150,
                    child: ListTile(
                      title: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => ImageDialogWidget(
                                        image_url: product.image,
                                      ));
                            },
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: product.image,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  cacheManager: DefaultCacheManager(),
                                  placeholder: (context, imageUrl) {
                                    return const Center(
                                      child: SpinKitFadingCircle(
                                        size: 20,
                                        color: AppColor.blueColor,
                                      ),
                                    );
                                  },
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  product.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('Price: \$${product.price}'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 5,
              ),
            );
          }
        },
      ),
    );
  }
}
