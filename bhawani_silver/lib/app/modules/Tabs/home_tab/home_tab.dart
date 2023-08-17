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
          isDarkTheme ? AppColor.blackColor : AppColor.cardBackgroundColor,
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
                  expandedHeight: 60,
                  backgroundColor: isDarkTheme ? AppColor.blackColor : AppColor.blueGrey,
                  pinned: true,
                  title: InkWell(
                    onTap: () => showSearch(
                        context: context,
                        delegate: MySearchDelegate()),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: AppColor.lightBlack, size: 25,),
                            const SizedBox(width: 10,),
                            Text("Search Bhawani Silver",style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.lightBlack, fontSize: 15)),
                            const Spacer(),
                            const Icon(Icons.mic,  color: AppColor.lightBlack, size: 25,)
                          ],
                        ),
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
                              height: 216,
                              child: CarouselSlider(
                                options: CarouselOptions(
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
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: 0.90, // Aspect ratio of each card
                    children: List.generate(products.length, (index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.OVERVIEW_OF_PRODUCT,
                              arguments: product);
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
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
