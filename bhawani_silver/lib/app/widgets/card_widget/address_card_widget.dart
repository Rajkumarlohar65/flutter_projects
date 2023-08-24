import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';

class AddressCardWidget extends StatelessWidget {
  final Address address;
  final VoidCallback onSelect;

  const AddressCardWidget({
    super.key,
    required this.address,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: AppColor.blueGrey,
                ),
                title: Text(address.name), // Replace with actual name
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.blueGrey,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.street),
                    Text(address.city),
                    Text(
                        '${address.landmark}, ${address.state}, ${address.pinCode}'),
                    Text(address.country),
                    Text('Phone number: ${address.mobileNumber}'),
                    // Rest of address details
                  ],
                ),
              ),
              SizedBox(
                  width: Get.width,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.backgroundColor),
                      foregroundColor:
                          MaterialStateProperty.all(AppColor.blackColor),
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 30)),
                    ),
                    child: const Text("Edit Address"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
