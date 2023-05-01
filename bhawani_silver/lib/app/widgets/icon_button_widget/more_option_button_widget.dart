import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class MoreOptionButtonWidget extends StatelessWidget {
  const MoreOptionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text("Settings"),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          Get.toNamed(Routes.SETTING);
        }
      },
      child: const Icon(Icons.more_vert),
    );
  }
}
