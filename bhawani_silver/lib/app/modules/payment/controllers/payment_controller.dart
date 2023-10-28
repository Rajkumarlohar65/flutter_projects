import 'package:BhawaniSilver/app/modules/Tabs/cart_tab/cart_tab_controller.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/controllers/overview_of_product_controller.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:BhawaniSilver/app/data/model/address.dart' as Ad;

class PaymentController extends GetxController {
//   final double discount = 50.0;
//   final ctc = Get.find<CartTabController>();
//   // Retrieve the selected address data passed from the SelectAddressView
//   Ad.Address selectedAddress = Get.arguments as Ad.Address;
//
//   // final myController = Get.find<OverviewOfProductController>();
//   final myController = Get.isRegistered<OverviewOfProductController>()
//       ? Get.find<OverviewOfProductController>()
//       : null;
//
//   void saveOrder({required String paymentId}) {
//     // Assuming you have the required data like 'selectedAddress' and 'myController' (if not, modify accordingly)
//     // Assuming you have the required data like 'selectedAddress' and 'myController' (if not, modify accordingly)
//     final List<Map<String, dynamic>> cartItems = ctc.cartItems.toList(); // Get a copy of cartItems
//
//     final List<Map<String, dynamic>> productDetails = cartItems.map((item) {
//       return {
//         'name': item['product_name'],
//         'price': item['product_price'],
//         'quantity': item['quantity']
//         // You can add more properties if needed
//       };
//     }).toList();
//
//     final orderData = {
//       'shippingAddress': {
//         'street': selectedAddress.street,
//         'city': selectedAddress.city,
//         'state': selectedAddress.state,
//         'pinCode': selectedAddress.pinCode,
//         'country': selectedAddress.country,
//       },
//       'productDetails': myController != null
//           ? {
//         'name': myController?.product.name,
//         'price': myController?.product.price,
//       }
//           : {
//         'items': productDetails, // Set the name to an empty string if myController is null
//       },
//       'subtotal': myController?.product.price ??
//           ctc.cartSubtotal
//               .value, // Or ctc.cartSubtotal.value if myController is null
//       'discount': discount,
//       'total': myController?.product.price ??
//           ctc.cartSubtotal.value -
//               discount, // Or ctc.cartSubtotal.value - discount if myController is null
//     };
//
//     final uid = FirebaseAuth.instance.currentUser!.uid;
//
// // Store the order data in the 'orders' collection in Firebase
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('orders')
//         .add(orderData)
//         .then((docRef) {
//       // Get the document ID of the newly added order
//       final orderId = docRef.id;
//
//       // Update the document with the orderId as its ID
//       docRef.update({
//         'orderId': orderId,
//       }).then((_) async {
//         // Order data successfully stored with orderId in Firebase
//         print('Order data stored with ID: $orderId');
//         // Show a success dialog or navigate to a success page if needed
//
//         Get.offAllNamed(Routes.ORDER_CONFIRMATION, arguments: paymentId);
//       }).catchError((error) {
//         // Handle any errors that occurred while updating the document
//         print('Error updating order data: $error');
//         // Show an error dialog or display an error message if needed
//         Get.snackbar('Error', 'Failed to process your order.',
//             snackPosition: SnackPosition.BOTTOM);
//       });
//     }).catchError((error) {
//       // Handle any errors that occurred while adding the order data
//       print('Error storing order data: $error');
//       // Show an error dialog or display an error message if needed
//       Get.snackbar('Error', 'Failed to process your order.',
//           snackPosition: SnackPosition.BOTTOM);
//     });
//   }

}
