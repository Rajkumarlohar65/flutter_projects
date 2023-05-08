import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/overview_of_product.controller.dart';

class OverviewOfProductScreen extends GetView<OverviewOfProductController> {
  const OverviewOfProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverviewOfProductScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OverviewOfProductScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
