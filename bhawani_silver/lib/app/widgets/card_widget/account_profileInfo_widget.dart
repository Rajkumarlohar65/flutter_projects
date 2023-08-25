import 'package:BhawaniSilver/app/data/model/userModel.dart';
import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountProfileInfoWidget extends StatelessWidget{
  const AccountProfileInfoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    AccountTabController controller = Get.find<AccountTabController>();
    return Obx(() => controller.isUserLoggedIn.value ? InkWell(
      onTap: () => Get.toNamed(Routes.PROFILE_INFO),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18)),
                  Text(
                    '${UserModel.email ?? ''}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ) : SizedBox());
  }

}