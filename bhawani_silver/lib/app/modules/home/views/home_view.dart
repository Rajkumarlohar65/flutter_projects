import 'package:BhawaniSilver/app/modules/Tabs/category_tab/category_tab.dart';
import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_string.dart';
import '../../Tabs/account_tab/account_tab.dart';
import '../../Tabs/cart_tab/cart_tab.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(builder: (controller){
      return Scaffold(
        appBar: SearchBarWidget(key: key,),

        body: IndexedStack(
          index: controller.currentIndex,
          children: const [
            HomeTab(),
            CategoryTab(),
            CartTab(),
            AccountTab()
          ],
        ),

        bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller){
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,

              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: AppString.homeNav),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: AppString.categoryNav),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: AppString.cartNav),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: AppString.accountNav)
              ],
              onTap: controller.changeTabIndex,
              currentIndex: controller.currentIndex,

            );
          },
        ),

      );
    });
  }

}

