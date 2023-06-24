import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          } else if (productSnapShot.hasError) {
            return Center(
              child: Text('Error: ${productSnapShot.error}'),
            );
          } else if (!productSnapShot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            final productDocs = productSnapShot.data!.docs;
            final products =
                productDocs.map((doc) => Product.fromSnapshot(doc)).toList();

            // Make sure there are products available before using them
            if (products.isEmpty) {
              return const Center(
                child: Text('No products available'),
              );
            }
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
                          const Expanded(
                              child: Text(
                            AppString.splashAppName,
                            style: TextStyle(color: Colors.cyan),
                          )),
                          InkWell(
                            child: const Icon(
                              Icons.search,
                              color: AppColor.greyColor,
                            ),
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
                      child: Obx(() => CarouselSlider(
                        options: CarouselOptions(
                          height: 300, // Set the desired height of the carousel
                          initialPage: controller.currentIndex.value,
                          enableInfiniteScroll: true, // Set whether to enable infinite scroll
                          autoPlay: true, // Set whether to enable auto-play
                          autoPlayInterval: const Duration(seconds: 5), // Set the auto-play interval
                          onPageChanged: (index, reason) {
                            controller.updateCurrentIndex(index);
                          },
                        ),
                        items: products.map((product) {
                          return InkWell(
                            onTap: () {
                              final product = products[controller.currentIndex.value];
                              Get.toNamed(Routes.OVERVIEW_OF_PRODUCT, arguments: product);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: CachedNetworkImage(
                                imageUrl: product.image,
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: 0.75, // Aspect ratio of each card
                    children: List.generate(products.length, (index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.OVERVIEW_OF_PRODUCT,
                              arguments: product);
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Price: \$${product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: AppColor.greyColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
