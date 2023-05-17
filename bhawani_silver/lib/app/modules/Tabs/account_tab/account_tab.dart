import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/logout_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundColor: AppColor.greyColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email ?? '',
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
                  Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.edit),
                          const SizedBox(width: 20,),
                          Text('Profile Info', style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Text('Settings', style: Theme.of(context).textTheme.titleLarge,),
                  ),

                  Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.edit),
                          const SizedBox(width: 20,),
                          Text('Profile Info', style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.SETTING);
                },
                child: const Text('Settings'),
              ),
            ),
            const SizedBox(width: double.infinity, child: LogOutButtonWidget()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
