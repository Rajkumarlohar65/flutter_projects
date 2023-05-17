import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';
import '../../../core/values/app_string.dart';
import '../../../widgets/dialog_box_widget/theme_dialog_widget.dart';

class AccountTab extends GetView<AccountTabController> {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = FirebaseAuth.instance.currentUser!.displayName ?? '';
    String email = FirebaseAuth.instance.currentUser!.email ?? '';
    String firstCapital = username.isNotEmpty ? username[0].toUpperCase() : '';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundColor: AppColor.greyColor,
                        child: Text(firstCapital, style: Theme.of(context).textTheme.titleLarge,),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      username,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFILE_INFO),
                    child: Card(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.edit),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Profile Info',
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                                Text(
                                  email,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const ThemeDialogWidget());
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      elevation: 10,
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
                                        Theme.of(context).textTheme.titleLarge),
                                Obx(() {
                                  return controller.themeMode.value ==
                                          ThemeMode.light
                                      ? const Text(AppString.lightTheme)
                                      : controller.themeMode.value ==
                                              ThemeMode.dark
                                          ? const Text(AppString.darkTheme)
                                          : const Text(AppString.systemDefault);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
