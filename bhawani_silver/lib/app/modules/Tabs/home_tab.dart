import 'package:bhawani_silver/app/modules/home/my_search_delegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                  return ListTile(
                    title: Row(
                      children: [
                        Text(name),
                        const SizedBox(width: 50,),
                        Text('Rs: ${price.toString()}')
                      ],
                    ),
                    subtitle: Text(description),
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
