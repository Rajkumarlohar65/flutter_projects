// widgets/address_card.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';

class AddressCardWidget extends StatelessWidget {
  final Address address;
  final VoidCallback onSelect;

  const AddressCardWidget({super.key, required this.address, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(address.street),
        subtitle: Text('${address.city}, ${address.state}, ${address.pinCode}, ${address.country}'),
        trailing: IconButton(
          icon: Icon(Icons.check),
          onPressed: onSelect,
        ),
      ),
    );
  }
}
