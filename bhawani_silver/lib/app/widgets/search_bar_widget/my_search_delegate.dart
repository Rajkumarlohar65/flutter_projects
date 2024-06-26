import 'package:BhawaniSilver/app/widgets/cache_networkImage_widget.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget/voice_search.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/values/app_color.dart';
import '../../core/values/app_string.dart';
import '../../data/model/product.dart';
import '../../routes/app_pages.dart';

class MySearchDelegate extends SearchDelegate {
  final VoiceSearchController voiceSearchController = VoiceSearchController();

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<QuerySnapshot> getProducts() async {
    return productsCollection.get();
  }

  @override
  String get searchFieldLabel => AppString.searchDelegateHint;

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 18.0);

  List<String> recentSearches = ['kada', 'pen'];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
      Visibility(
        visible: query.isEmpty,
        child: IconButton(
          onPressed: () {
            voiceSearchController.startListening((String result) {
              query = result;
              showResults(context);
            });
          },
          icon: Obx(() {
            return voiceSearchController.isListening.value
                ? InkWell(
                    onTap: voiceSearchController.stopListening,
                    child: Lottie.asset(
                        'assets/animations/mic.json', // Replace this with your Lottie animation file path
                        width:
                            500, // Set the width and height of the animation as per your preference
                        height: 500,
                        reverse: true),
                  )
                : const Icon(
                    Icons.mic,
                  );
          }),
        ),
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: getProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> productSnapShot) {
        if (productSnapShot.hasError) {
          return Text('Error: ${productSnapShot.error}');
        }

        if (productSnapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final productDocs = productSnapShot.data!.docs;
        final products = productDocs.map((doc) => doc['name']).toList();

        final List suggestions = query.isEmpty
            ? recentSearches
            : products
                .where((product) =>
                    product.toLowerCase().contains(query.toLowerCase()))
                .toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.search),
              title: Text(suggestions[index]),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    voiceSearchController.isListening.value = false;
    if (query.isEmpty) {
      return ListView.builder(
        itemCount: recentSearches.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.search),
            title: Text(recentSearches[index]),
            onTap: () {
              query = recentSearches[index];
              showResults(context);
            },
          );
        },
      );
    }
    return FutureBuilder<QuerySnapshot>(
      future: _getProductSnapshot(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> productSnapShot) {
        if (productSnapShot.hasError) {
          return Text('Error: ${productSnapShot.error}');
        }

        if (productSnapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final productDocs = productSnapShot.data!.docs;
        final products =
            productDocs.map((doc) => Product.fromSnapshot(doc)).toList();

        if (products.isEmpty) {
          // Display a message when no products are found
          return Center(
            child: Lottie.asset(
                'assets/animations/not_found.json', // Replace this with your Lottie animation file path
                width:
                    250, // Set the width and height of the animation as per your preference
                height: 250,
                reverse: true),
          );
        }

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.OVERVIEW_OF_PRODUCT, arguments: product);
              },
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 100, // Set a fixed width for the leading item
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: CachedNetworkImageWidget(
                              imageUrl: product.image,
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'price : ${product.price} Rs',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColor.greyColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
  }

  Future<QuerySnapshot> _getProductSnapshot() async {
    try {
      final snapshot = await productsCollection
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '${query}z')
          .get();
      return snapshot;
    } catch (e) {
      print('Error getting product snapshot: $e');
      throw e;
    }
  }
}
