import 'package:BhawaniSilver/app/core/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AddressController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? country;
  String? name;
  int? mobileNumber;
  String? street;
  String? landmark;
  int? pinCode;
  String? city;
  String? state;

  RxBool isLoading = false.obs;

  final TextEditingController countryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  void saveAddress(){
    final uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('address')
        .doc().set({'country': country, 'name': name, 'mobile number': mobileNumber, 'street': street, 'landmark': landmark, 'pincode': pinCode, 'city': city, 'state': state}
    );
    Utils().showSuccessToast("Address Saved");
    Get.offNamed(Routes.SELECT_ADDRESS);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
