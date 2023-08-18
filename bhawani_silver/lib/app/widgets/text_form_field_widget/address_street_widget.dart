import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressStreetWidget extends StatelessWidget {
  const AddressStreetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.streetController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "Street",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Street";
        }
        return null;
      },
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLevel1],
      onSaved: (value) {
        controller.street = value;
      },
    );
  }
}
