import 'package:BhawaniSilver/app/modules/Tabs/home_tab/home_tab.dart';
import 'package:BhawaniSilver/app/modules/home/views/home_view_android.dart';
import 'package:BhawaniSilver/app/modules/home/views/home_view_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const HomeViewWeb() : const HomeViewAndroid();
  }
}
