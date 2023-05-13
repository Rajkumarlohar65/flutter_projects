import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:BhawaniSilver/app/widgets/list_tile_widget/theme_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.settingAppBarTitle,
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  ThemeListTileWidget(),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Language"),
                    subtitle: Text("English"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              );
            }));
  }
}
