import 'package:bhawani_silver/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeDialogWidget extends StatelessWidget {
  const ThemeDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return Obx(() {
      return AlertDialog(
        title: const Text('Select a Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Light Theme'),
              value: ThemeMode.light,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.light);
              },
            ),
            RadioListTile(
              title: const Text('Dark Theme'),
              value: ThemeMode.dark,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.dark);
              },
            ),
            RadioListTile(
              title: const Text('System default'),
              value: ThemeMode.system,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.system);
              },
            ),
          ],
        ),
      );
    });
  }
}
