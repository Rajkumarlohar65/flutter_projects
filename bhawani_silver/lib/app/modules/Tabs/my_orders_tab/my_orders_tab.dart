import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_oders_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/search_bar_widget.dart';

class MyOrdersTab extends GetView<MyOrdersTabController> {
  const MyOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My orders'
        ),
      ),
    );
  }
}
