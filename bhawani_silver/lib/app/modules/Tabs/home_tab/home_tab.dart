import 'package:bhawani_silver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:bhawani_silver/app/widgets/dialog_box_widget/image_dialog_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name),
                              const SizedBox(height: 8),
                              Text('price : ${product.price} Rs'),
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
      // ListView.builder(
      //     itemCount: MySearchDelegate().products.length,
      //     itemBuilder: (context, int index) {
      //       return ListTile(
      //           leading: const Icon(Icons.online_prediction),
      //           title: Text(MySearchDelegate().products[index]));
      //     }),
    );
  }
}
