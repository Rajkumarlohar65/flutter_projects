import 'package:BhawaniSilver/app/data/model/banner.dart';
import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/cache_networkImage_widget.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:BhawaniSilver/app/widgets/shimmer_placeHolder_widget.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                SliverToBoxAdapter(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: controller.bannerStream,
                    builder: (context, bannerSnapShot) {
                      if (bannerSnapShot.connectionState ==
                          ConnectionState.waiting) {
                        return const ShimmerPlaceholderWidget(
                            width: double.infinity, height: 216);
                      } else if (bannerSnapShot.hasError) {
                        return Center(
                          child: Text('Error: ${bannerSnapShot.error}'),
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
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              height: 216,
                              width: Get.width,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  viewportFraction: 1.0,
                                  aspectRatio: 1.0,
                                  initialPage: controller.currentIndex.value,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  onPageChanged: (index, reason) {
                                    controller.updateCurrentIndex(index);
                                  },
                                ),
                                itemCount: banners.length,
                                itemBuilder: (context, index, realIndex) {
                                  final banner = banners[index];
                                  return Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: CachedNetworkImageWidget(
                                          imageUrl: banner.url,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => AnimatedSmoothIndicator(
                                  activeIndex: controller.currentIndex.value,
                                  count: banners.length,
                                  effect:  const SlideEffect(
                                      spacing:  8.0,
                                      radius:  10,
                                      dotWidth:  8,
                                      dotHeight:  8,
                                      strokeWidth:  1.5,
                                      dotColor:  AppColor.greyColor,
                                      activeDotColor:  AppColor.whiteColor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.90,
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Center(
                                  child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: CachedNetworkImageWidget(
                                        imageUrl: product.image,
                                      )),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  product.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, right: 8, left: 8, bottom: 4),
                                child: Text(
                                  'Price: ₹${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColor.greyColor),
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
          // Return a default empty widget (this covers all code paths)
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
