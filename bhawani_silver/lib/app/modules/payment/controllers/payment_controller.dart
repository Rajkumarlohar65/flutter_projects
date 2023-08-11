import 'dart:convert';
import 'package:BhawaniSilver/app/data/model/address.dart' as Ad;
import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  final double discount = 50.0;

  final ctc = Get.find<CartTabController>();
  // Retrieve the selected address data passed from the SelectAddressView
  Ad.Address selectedAddress = Get.arguments as Ad.Address;

  final myController = Get.find<OverviewOfProductController>();

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent();

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "IN", currencyCode: "inr", testEnv: true);

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData!["client_secret"],
              style: ThemeMode.dark,
              merchantDisplayName: "Rajkumar",
              googlePay: gpay));
      await displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception: $e$s');
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print("Payment Successfully"));
      print("Done");
    } catch (e) {
      print("Failed");
      print(e);
    }
  }

  createPaymentIntent() async {
    int? totalAmount = (myController.product.price - discount).toInt();
    try {
      Map<String, dynamic> body = {
        'amount': (totalAmount * 100).toString(),
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

  void saveOrder() {
    // Assuming you have the required data like 'selectedAddress' and 'myController' (if not, modify accordingly)
    final orderData = {
      'shippingAddress': {
        'street': selectedAddress.street,
        'city': selectedAddress.city,
        'state': selectedAddress.state,
        'pinCode': selectedAddress.pinCode,
        'country': selectedAddress.country,
      },
      'productDetails': myController != null
          ? {
              'name': myController.product.name,
              'price': myController.product.price,
            }
          : {
              'name':
                  '', // Set the name to an empty string if myController is null
              'price': 0, // Set the price to 0 if myController is null
            },
      'subtotal': myController?.product.price ??
          ctc.cartSubtotal
              .value, // Or ctc.cartSubtotal.value if myController is null
      'discount': discount,
      'total': myController?.product.price ??
          ctc.cartSubtotal.value -
              discount, // Or ctc.cartSubtotal.value - discount if myController is null
    };

    final uid = FirebaseAuth.instance.currentUser!.uid;

// Store the order data in the 'orders' collection in Firebase
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .add(orderData)
        .then((docRef) {
      // Get the document ID of the newly added order
      final orderId = docRef.id;

      // Update the document with the orderId as its ID
      docRef.update({
        'orderId': orderId,
      }).then((_) async {
        // Order data successfully stored with orderId in Firebase
        print('Order data stored with ID: $orderId');
        // Show a success dialog or navigate to a success page if needed
        // Get.snackbar('Payment Successful', 'Thank you for your purchase!',
        //     snackPosition: SnackPosition.BOTTOM);
        // Get.offAllNamed(Routes.HOME);
        await makePayment();
      }).catchError((error) {
        // Handle any errors that occurred while updating the document
        print('Error updating order data: $error');
        // Show an error dialog or display an error message if needed
        Get.snackbar('Error', 'Failed to process your order.',
            snackPosition: SnackPosition.BOTTOM);
      });
    }).catchError((error) {
      // Handle any errors that occurred while adding the order data
      print('Error storing order data: $error');
      // Show an error dialog or display an error message if needed
      Get.snackbar('Error', 'Failed to process your order.',
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
