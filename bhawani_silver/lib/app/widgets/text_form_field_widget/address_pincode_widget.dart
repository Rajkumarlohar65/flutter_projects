import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressPincodeWidget extends StatelessWidget {
  const AddressPincodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    // Define a custom input formatter to limit to 8 digits
    final pincodeFormatter = FilteringTextInputFormatter.digitsOnly;

    // Use LengthLimitingTextInputFormatter to limit the length
    final lengthLimitFormatter = LengthLimitingTextInputFormatter(8);
    return TextFormField(
      controller: controller.pincodeController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "Pincode",
      ),
      keyboardType: TextInputType.number, // Set keyboard type to allow only numeric input
      inputFormatters: [pincodeFormatter, lengthLimitFormatter],
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
