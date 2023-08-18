import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressMobileNumberWidget extends StatelessWidget {
  const AddressMobileNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.mobileNumberController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "Mobile Number",
      ),
      keyboardType:
          TextInputType.phone, // Set keyboard type to allow only numeric input
      autofillHints: const [AutofillHints.telephoneNumber],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Mobile Number";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          controller.mobileNumber = int.parse(value);
        } else {
          controller.mobileNumber =
              0; // Default value in case the input is empty
        }
      },
    );
  }
}
