import 'package:bhawani_silver/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/values/app_string.dart';

class ThemeDialogWidget extends StatelessWidget {
  const ThemeDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    const key = 'key';

    final controller = Get.find<SettingController>();
    return Obx(() {
      return AlertDialog(
        title: const Text(AppString.selectATheme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text(AppString.lightTheme),
              value: ThemeMode.light,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.light);
                box.write(key, 'Light');
              },
            ),
            RadioListTile(
              title: const Text(AppString.darkTheme),
              value: ThemeMode.dark,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.dark);
                box.write(key, 'Dark');
              },
            ),
            RadioListTile(
              title: const Text(AppString.systemDefault),
              value: ThemeMode.system,
              groupValue: controller.themeMode.value,
              onChanged: (value) {
                controller.changeThemeMode(ThemeMode.system);
                box.write(key, 'System');
              },
            ),
          ],
        ),
      );
    });
  }
}
