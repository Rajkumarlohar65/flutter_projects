import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:BhawaniSilver/app/modules/payment/controllers/payment_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateWay  {
  final BuildContext context;
  PaymentGateWay({required this.context});
  PaymentController paymentController = Get.put(PaymentController());
  final myController = Get.isRegistered<OverviewOfProductController>()
      ? Get.find<OverviewOfProductController>()
      : null;
  CartTabController ctc = Get.put(CartTabController());

  void handlePaymentErrorResponse(PaymentFailureResponse response){
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    String paymentId = response.paymentId!; // Use ! to assert that paymentId is not null
    paymentController.saveOrder(paymentId: paymentId);

    // Navigate to the Payment_Confirmation route and pass the paymentId as a parameter
    // Get.toNamed(Routes.ORDER_CONFIRMATION, arguments: paymentId);
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Get.offAllNamed(Routes.HOME);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




}
