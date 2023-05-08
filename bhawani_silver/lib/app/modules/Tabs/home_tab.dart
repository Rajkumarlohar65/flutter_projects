import 'package:bhawani_silver/app/routes/app_pages.dart';
import 'package:bhawani_silver/app/widgets/dialog_box_widget/image_dialog_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
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
            return ListView.builder(
                itemCount: productDocs.length,
                itemBuilder: (context, index) {
                  final name = productDocs[index]['name'] ?? '';
                  final description = productDocs[index]['description'] ?? '';
                  final price = productDocs[index]['price'] ?? '';
                  final image = productDocs[index]['image'] ?? '';

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.OVERVIEW_OF_PRODUCT, arguments: {
                        'name': name,
                        'price': price,
                        'description': description,
                        'image': image
                      });
                    },
                    child: SizedBox(
                      height: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(bottom: 20),
                        title: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ImageDialogWidget(image_url: image,));
                              },
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: CachedNetworkImage(
                                    imageUrl: image,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name),
                                const SizedBox(height: 8),
                                Text('price : ${price.toString()} Rs'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
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
