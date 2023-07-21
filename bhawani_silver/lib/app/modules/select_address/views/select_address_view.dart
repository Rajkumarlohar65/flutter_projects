import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/address_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../controllers/select_address_controller.dart';

class SelectAddressView extends GetView<SelectAddressController> {
  const SelectAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Address'),
      ),
      body: Obx(() {
        if (controller.addresses.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.addresses.length,
            itemBuilder: (context, index) {
              Address address = controller.addresses[index];
              return AddressCardWidget(
                address: address,
                onSelect: () {
                  Get.toNamed(Routes.PAYMENT);
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Get.toNamed(Routes.ADDRESS);
      }, label: Text("Add new Address")),
    );
  }
}