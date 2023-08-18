import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressNameWidget extends StatelessWidget {
  const AddressNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return TextFormField(
      controller: controller.nameController,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: const InputDecoration(
        labelText: "Name",
      ),
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Full Name";
        }
        return null;
      },
      onSaved: (value) {
        controller.name = value;
      },
    );
  }
}
