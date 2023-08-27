import 'package:BhawaniSilver/app/data/firebase/Authentication/authentication_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';
import '../../routes/app_pages.dart';

class ProceedToBuyButtonWidget extends StatelessWidget {
  final List<dynamic> cartDocs;

  const ProceedToBuyButtonWidget(this.cartDocs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          if(!AuthenticationHelper().isUserLoggedIN()){
            Get.toNamed(Routes.LOGIN);
          }else{
            Get.toNamed(Routes.SELECT_ADDRESS, arguments: cartDocs);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.yellowColor),
          foregroundColor: MaterialStateProperty.all(AppColor.blackColor),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 40),
          ),
        ),
        child: const Text(
          'Proceed to Buy',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
