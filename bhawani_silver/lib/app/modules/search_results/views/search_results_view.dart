import 'package:bhawani_silver/app/data/model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/dialog_box_widget/image_dialog_widget.dart';
import '../controllers/search_results_controller.dart';

class SearchResultsView extends GetView<SearchResultsController> {
  const SearchResultsView({super.key});


  @override
  Widget build(BuildContext context) {
    final Product product = controller.product;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Results'),
        ),
        body: ListView.separated(
          itemCount: 1,
          itemBuilder: (context, index) {
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
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 5,
          ),
        ));
  }
}