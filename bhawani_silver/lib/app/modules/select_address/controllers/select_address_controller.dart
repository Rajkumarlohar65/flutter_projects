import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/model/address.dart';

class SelectAddressController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Address> _addresses = RxList<Address>([]);

  List<Address> get addresses => _addresses;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  void fetchAddresses() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid; // Replace with the actual user ID of the logged-in user
      final querySnapshot = await _firestore.collection('users').doc(uid).collection('address').get();
      final List<Address> fetchedAddresses = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Address(
          id: doc.id,
          street: data['street'] ?? '',
          landmark: data['landmark'] ?? '',
          city: data['city'] ?? '',
          state: data['state'] ?? '',
          pinCode: data['pincode'] ?? '',
          country: data['country'] ?? '',
          mobileNumber: data['mobile number'] ?? '',
        );
      }).toList();
      _addresses.assignAll(fetchedAddresses);
    } catch (e) {
      // Handle any errors that occur during data fetching
      print('Error fetching addresses: $e');
    }
  }
}