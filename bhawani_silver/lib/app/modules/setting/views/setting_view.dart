import 'package:bhawani_silver/app/widgets/dialog_box_widget/theme_dialog_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SettingView'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: const Text("Theme"),
                      subtitle: const Text("Dark Mode"),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ThemeDialogWidget());
                      }),
                  const ListTile(
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
