import 'package:BhawaniSilver/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_string.dart';
import '../dialog_box_widget/theme_dialog_widget.dart';

class ThemeListTileWidget extends StatelessWidget{
  const ThemeListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return ListTile(
        leading: Obx(() {
          return controller.themeMode.value == ThemeMode.light
              ? const Icon(Icons.light_mode)
              : controller.themeMode.value == ThemeMode.dark
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.settings_brightness_rounded);
        }),
        title: const Text(AppString.theme),
        subtitle: Obx(() {
          return controller.themeMode.value == ThemeMode.light
              ? const Text(AppString.lightTheme)
              : controller.themeMode.value == ThemeMode.dark
              ? const Text(AppString.darkTheme)
              : const Text(AppString.systemDefault);
        }),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => const ThemeDialogWidget());
        });
  }

}