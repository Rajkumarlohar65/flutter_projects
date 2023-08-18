import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCityWidget extends StatelessWidget {
  const AddressCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.cityController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "City/Town",
      ),
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.addressCity],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter City/Town";
        }
        return null;
      },

      onSaved: (value) {
        controller.city = value;
      },
    );
  }
}
