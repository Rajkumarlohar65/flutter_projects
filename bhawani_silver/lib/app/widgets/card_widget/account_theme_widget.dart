import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab_controller.dart';
import 'package:BhawaniSilver/app/widgets/dialog_box_widget/theme_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountThemeWidget extends StatelessWidget{
  const AccountThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountTabController>();
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => const ThemeDialogWidget());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Obx(() {
                return controller.themeMode.value ==
                    ThemeMode.light
                    ? const Icon(Icons.light_mode)
                    : controller.themeMode.value == ThemeMode.dark
                    ? const Icon(Icons.dark_mode)
                    : const Icon(
                    Icons.settings_brightness_rounded);
              }),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Theme',
                      style:
                      Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18)),
                  Obx(() {
                    return controller.themeMode.value ==
                        ThemeMode.light
                        ? Text(AppString.lightTheme, style: Theme.of(context).textTheme.bodySmall)
                        : controller.themeMode.value ==
                        ThemeMode.dark
                        ? Text(AppString.darkTheme, style: Theme.of(context).textTheme.bodySmall)
                        : Text(AppString.systemDefault, style: Theme.of(context).textTheme.bodySmall);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}