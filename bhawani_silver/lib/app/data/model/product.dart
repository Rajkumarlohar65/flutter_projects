import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  final String productId;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.productId,
  });

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Product(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] ?? 0,
      image: data['image'] ?? '',
      productId: snapshot.id,
    );
  }
}
