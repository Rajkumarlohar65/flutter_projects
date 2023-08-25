import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_android.dart';
import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends GetView<HomeTabController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    return const HomeTabAndroid();
  }
}
