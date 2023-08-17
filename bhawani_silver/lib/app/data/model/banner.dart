import 'package:cloud_firestore/cloud_firestore.dart';

class AppBanner {
  final String url;

  AppBanner({
    required this.url,
  });

  factory AppBanner.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AppBanner(
      url: data['url'] ?? '',
    );
  }
}
