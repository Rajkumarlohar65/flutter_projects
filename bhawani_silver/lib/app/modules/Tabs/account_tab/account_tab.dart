import 'package:BhawaniSilver/app/data/model/userModel.dart';
import 'package:BhawaniSilver/app/modules/Tabs/account_tab/account_tab_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/account_profileInfo_widget.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/account_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_color.dart';

class AccountTab extends GetView<AccountTabController> {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? firstCapital;

    if (controller.isUserLoggedIn.value) {
      firstCapital = UserModel.name?.isNotEmpty == true
          ? UserModel.name![0].toUpperCase()
          : '';
    } else {
      firstCapital = ''; // Set it to an empty string if user is not logged in
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(() => Center(
                child: controller.isUserLoggedIn.value ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundColor: AppColor.whiteColor,
                        child: Text(firstCapital!, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.blueGrey),),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${UserModel.name}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.whiteColor),
                    ),
                    Text(
                      '${UserModel.email}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.whiteColor),
                    ),
                  ],
                ) : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          child: Icon(Icons.account_circle)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(AppColor.yellowColor),
                                    foregroundColor: MaterialStateProperty.all(Colors.black), // You can adjust the text color
                                  ),
                                  child: const Text('Login to your account'),
                                )

                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.toNamed(Routes.SIGNUP);
                              },
                              child: const Text('Sign up now', style: TextStyle(color: AppColor.whiteColor),),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),)
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
                  const AccountProfileInfoWidget(),
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
                  const AccountThemeWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
