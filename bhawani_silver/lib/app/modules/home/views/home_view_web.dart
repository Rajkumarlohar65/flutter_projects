import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab.dart';
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab.dart';
import 'package:BhawaniSilver/app/modules/Tabs/category_tab/category_tab.dart';
import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab.dart';
import 'package:BhawaniSilver/app/modules/Tabs/my_orders_tab/my_orders_tab.dart';
import 'package:BhawaniSilver/app/modules/home/controllers/home_controller.dart';
import 'package:BhawaniSilver/app/widgets/app_bar_web_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeViewWeb extends GetView<HomeController> {
  const HomeViewWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      // Define a list of tabs
      final List<Widget> tabs = [
        const HomeTab(),
        const CategoryTab(),
        const MyOrdersTab(),
        const CartTab(),
        const AccountTab()
      ];

      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarWebWidget(onTabSelected: controller.changeTabIndex),  // Pass callback to update tab index
            Expanded(
              child: tabs[controller.currentIndex],  // Show the selected tab content
            ),
          ],
        ),
      );
    });
  }
}
