import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('cart').snapshots(),
      builder: (context, cartSnapShot) {
        if (cartSnapShot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final cartDocs = cartSnapShot.data!.docs;
          if (cartDocs.isEmpty) {
            return const Center(
              child: Text('No items in cart.'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartDocs.length,
                    itemBuilder: (context, index) {
                      final productId = cartDocs[index]['product_id'] ?? '';
                      final quantity = cartDocs[index]['quantity'] ?? '';
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance.collection('products').doc(productId).get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No data available'),
                            );
                          } else {
                            final productData = snapshot.data!.data() as Map<String, dynamic>?;
                            final productName = productData?['name'] ?? '';
                            final productPrice = productData?['price'] ?? '';
                            final productImageUrl = productData?['image'] ?? '';
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(productImageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(productName, style: Theme.of(context).textTheme.titleLarge),
                                          const SizedBox(height: 8),
                                          Text('Price: \$${productPrice.toStringAsFixed(2)}'),
                                          const SizedBox(height: 8),
                                          Text('Quantity: $quantity'),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        FirebaseFirestore.instance.collection('users').doc(uid).collection('cart').doc(cartDocs[index].id).delete();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                if (cartSnapShot.connectionState == ConnectionState.waiting)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          }
        }
      },
    );
  }
}
