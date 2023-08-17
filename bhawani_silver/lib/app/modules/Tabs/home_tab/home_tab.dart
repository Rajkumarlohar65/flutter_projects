import 'package:BhawaniSilver/app/data/model/banner.dart';
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
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDarkTheme ? Colors.black : AppColor.cardBackgroundColor,
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
                  backgroundColor: isDarkTheme ? Colors.black : AppColor.cardBackgroundColor,
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
                            style: TextStyle(color: isDarkTheme ? Colors.white : Colors.blueGrey,),
                          )),
                          InkWell(
                            child: Icon(
                              Icons.search,
                              color: isDarkTheme ? Colors.white : Colors.blueGrey,
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
                  ),
                ),
                SliverToBoxAdapter(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: controller.bannerStream,
                      builder: (context, bannerSnapShot) {
                        if (bannerSnapShot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (bannerSnapShot.hasError) {
                          return Center(
                            child:
                            Text('Error: ${bannerSnapShot.error}'),
                          );
                        } else if (!bannerSnapShot.hasData) {
                          return const Center(
                            child: Text('No data available'),
                          );
                        } else {
                          final bannerDocs = bannerSnapShot.data!.docs;
                          final banners = bannerDocs
                              .map((doc) => AppBanner.fromSnapshot(doc))
                              .toList();

                          // Make sure there are products available before using them
                          if (banners.isEmpty) {
                            return const Center(
                              child: Text('No products available'),
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: SizedBox(
                              height: 210,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  aspectRatio: 1,
                                  initialPage: controller.currentIndex.value,
                                  enableInfiniteScroll: true, // Set whether to enable infinite scroll
                                  autoPlay: true, // Set whether to enable auto-play
                                  autoPlayInterval: const Duration(seconds: 5), // Set the auto-play interval
                                  onPageChanged: (index, reason) {
                                    controller.updateCurrentIndex(index);
                                  },
                                ),
                                items: List.generate(banners.length, (index) {
                                  final banner = banners[index];
                                  return CachedNetworkImage(imageUrl: banner.url);
                                }),
                              ),
                            ),
                          );

                        }
                      }),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: 0.80, // Aspect ratio of each card
                    children: List.generate(products.length, (index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.OVERVIEW_OF_PRODUCT,
                              arguments: product);
                        },
                        child: Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Price: ₹${product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
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
