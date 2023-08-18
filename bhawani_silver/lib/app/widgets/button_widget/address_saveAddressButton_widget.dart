import 'package:BhawaniSilver/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';

class AddressSaveAddressButtonWidget extends StatelessWidget {
  const AddressSaveAddressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            controller.formKey.currentState!.save();
            controller.saveAddress();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                AppColor.yellowColor),
            foregroundColor: MaterialStateProperty.all(
                AppColor.blackColor),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50))),
        child: const Text("Save Address"),
      ),
    );
  }
}
