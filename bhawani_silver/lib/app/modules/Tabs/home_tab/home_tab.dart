import 'dart:async';
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
import '../../../core/values/app_string.dart';
import '../../../data/model/product.dart';
import '../../home/my_search_delegate.dart';

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
            int currentIndex = 0;

            Timer.periodic(const Duration(seconds: 10), (timer) {
              currentIndex = (currentIndex + 1) % products.length;
              controller.updateCurrentIndex(
                  currentIndex); // Update the index in the controller
            });
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            AppString.splashAppName,
                            style: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? const TextStyle(
                                    color: Colors
                                        .white) // Set text color to white for dark mode
                                : const TextStyle(color: Colors.black),
                          )),
                          InkWell(
                            child: const Icon(Icons.search),
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: MySearchDelegate());
                            },
                          ),
                        ],
                      ),
                    ),
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Obx(() => InkWell(
                            onTap: () {
                              final product =
                                  products[controller.currentIndex.value];
                              Get.toNamed(Routes.OVERVIEW_OF_PRODUCT,
                                  arguments: product);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: CachedNetworkImage(
                                imageUrl:
                                    products[controller.currentIndex.value]
                                        .image,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.OVERVIEW_OF_PRODUCT,
                                arguments: product);
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
                                        ),
                                      );
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: CachedNetworkImage(
                                        imageUrl: product.image,
                                        cacheManager: DefaultCacheManager(),
                                        placeholder: (context, imageUrl) {
                                          return const Center(
                                            child: SpinKitFadingCircle(
                                              size: 20,
                                              color: AppColor.blueColor,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: AppColor.blackColor,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Price: \$${product.price}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: products.length,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
