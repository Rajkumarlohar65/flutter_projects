import 'package:BhawaniSilver/app/modules/address/views/address_view_android.dart';
import 'package:BhawaniSilver/app/modules/address/views/address_view_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const AddressViewWeb() : const AddressViewAndroid();
  }
}
