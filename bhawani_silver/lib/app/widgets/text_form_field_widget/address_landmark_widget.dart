import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressLandmarkWidget extends StatelessWidget {
  const AddressLandmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.landmarkController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "LandMark",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Landmark";
        }
        return null;
      },
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLevel2],
      onSaved: (value) {
        controller.landmark = value;
      },
    );
  }
}
