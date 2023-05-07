import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static saveUser(String name, String email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'name': name, 'email': email});
  }
}
