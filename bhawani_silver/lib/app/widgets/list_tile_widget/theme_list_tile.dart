import 'package:bhawani_silver/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: const Text("Theme"),
        subtitle: Obx(() {
          return controller.themeMode.value == ThemeMode.light
              ? const Text("Light Theme")
              : controller.themeMode.value == ThemeMode.dark
              ? const Text("Dark Theme")
              : const Text("System default");
        }),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => const ThemeDialogWidget());
        });
  }

}