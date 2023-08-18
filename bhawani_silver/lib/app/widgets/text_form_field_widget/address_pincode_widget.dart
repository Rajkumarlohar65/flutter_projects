import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPincodeWidget extends StatelessWidget {
  const AddressPincodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.pincodeController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "Pincode",
      ),
      keyboardType: TextInputType.number, // Set keyboard type to allow only numeric input
      autofillHints: const [AutofillHints.postalCode],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Pin Code";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          controller.pinCode = int.parse(value);
        } else {
          controller.pinCode = 0; // Default value in case the input is empty
        }
      },
    );
  }
}
