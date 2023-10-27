import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateWay  {
  final BuildContext context;
  PaymentGateWay({required this.context});
  // PaymentController controller = Get.find();
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }
  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    // double paymentAmount = response.amount.toDouble();
    double paymentAmount = 1.0;
    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}\nNew Balance: $paymentAmount",
    );
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
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
