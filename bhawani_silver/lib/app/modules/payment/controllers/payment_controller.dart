import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent();

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "IN", currencyCode: "inr", testEnv: true);
      
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "Rajkumar",
        googlePay: gpay
      ));
      await displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception: $e$s');
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) => print("Payment Successfully"));
      print("Done");
    } catch (e) {
      print("Failed");
      print(e);
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        'amount': '3000',
        'currency': "inr",
        'payment_method_types[]': 'card',
      };
      print(body);
      http.Response response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer ' +
              'sk_test_51Nd5I0SArhJ5v6asYKZ6ZWCarTG2tkj1b3ABJowp8JFpA3KLiPTW28zh9EdPFA4EIdIxkpaU9FobvSbgzKlWAFGb00tit0FCFl',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      print('Create Intent response ===> ${response.body}');
      return json.decode(response.body);
    } catch (err) {
      print('Error charging user: ${err.toString()}');
      throw err;
    }
  }
}
