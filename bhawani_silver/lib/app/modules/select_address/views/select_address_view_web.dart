import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/data/model/address.dart';
import 'package:BhawaniSilver/app/modules/select_address/controllers/select_address_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/address_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectAddressViewWeb extends GetView<SelectAddressController> {
  const SelectAddressViewWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Select a delivery address')),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.addresses.isEmpty) {
            return const Center(
              child: Text("No Addresses Found"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.addresses.length,
              itemBuilder: (context, index) {
                Address address = controller.addresses[index];
                return AddressCardWidget(
                  address: address,
                  onSelect: () {
                    Get.toNamed(Routes.PAYMENT, arguments: address);
                  },
                );
              },
            );
          }
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.offNamed(Routes.ADDRESS);
        },
        label: const Text("Add new Address"),
        backgroundColor: AppColor.blueGrey,
        icon: const Icon(Icons.home),
      ),
    );
  }
}
