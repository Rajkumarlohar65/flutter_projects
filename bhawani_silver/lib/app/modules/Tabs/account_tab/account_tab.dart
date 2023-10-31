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
      firstCapital =
          ''; // Set it to an empty string if the user is not logged in
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Obx(() => Center(
                  child: controller.isUserLoggedIn.value
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundColor: AppColor.blueGrey,
                                child: Text(
                                  firstCapital!,
                                  style: const TextStyle(
                                    color: Colors.white, // Set the text color to white
                                    fontSize: 16, // You can adjust the font size as needed
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${UserModel.name}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              '${UserModel.email}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).brightness == Brightness.dark
                                        ? AppColor.blackColor
                                        : AppColor.darkNavy,
                                    child: const Icon(Icons.account_circle, size: 100, color: AppColor.whiteColor,),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
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
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColor.yellowColor),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                            // You can adjust the text color
                                          ),
                                          child: const Text(
                                              'Login to your account'),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.SIGNUP);
                                        },
                                        child: const Text(
                                          'Sign up now',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                )),
          ),
          const Divider(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
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
                        const AccountThemeWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
