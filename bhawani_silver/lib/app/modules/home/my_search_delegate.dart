import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import '../../core/values/app_string.dart';
import '../../data/model/product.dart';
import '../../routes/app_pages.dart';

class MySearchDelegate extends SearchDelegate {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  String get searchFieldLabel => AppString.searchDelegateHint;

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 18.0);

  List<String> recentSearches = ['chain', 'kada', 'pen'];

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
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: productsCollection.get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> productSnapShot) {
        if (productSnapShot.hasError) {
          return Text('Error: ${productSnapShot.error}');
        }

        if (productSnapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
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
      future: productsCollection
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '${query}z')
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> productSnapShot) {
        if (productSnapShot.hasError) {
          return Text('Error: ${productSnapShot.error}');
        }

        if (productSnapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final productDocs = productSnapShot.data!.docs;
        final products =
            productDocs.map((doc) => Product.fromSnapshot(doc)).toList();

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
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
                      AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: product.image,
                            width: 100,
                            fit: BoxFit.cover,
                            cacheManager: DefaultCacheManager(),
                          )),
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
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
  }
}
