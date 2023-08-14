import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(title: Text('Address Screen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Text(
                "Enter Address",
                style: GoogleFonts.alike(fontSize: 25),
              ),
            ),
            Form(
              key: controller.formKey,
              child: Container(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    right: screenWidth * 0.05,
                    left: screenWidth * 0.05,
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.countryController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                labelText: "Country",
                                labelStyle: TextStyle(fontSize: 15),
                                contentPadding: EdgeInsets.zero),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Country";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            autofillHints: const [AutofillHints.countryName],
                            onSaved: (value) {
                              controller.country = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.mobileNumberController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Mobile Number",
                              labelStyle: TextStyle(fontSize: 15),
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.phone, // Set keyboard type to allow only numeric input
                            autofillHints: const [AutofillHints.telephoneNumber],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Mobile Number";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              if (value != null && value.isNotEmpty) {
                                controller.mobileNumber = int.parse(value);
                              } else {
                                controller.mobileNumber = 0; // Default value in case the input is empty
                              }
                            },
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.streetController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                labelText: "Street",
                                labelStyle: TextStyle(fontSize: 15),
                                contentPadding: EdgeInsets.zero),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Street";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            autofillHints: const [AutofillHints.streetAddressLevel1],
                            onSaved: (value) {
                              controller.street = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.landmarkController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                labelText: "LandMark",
                                labelStyle: TextStyle(fontSize: 15),
                                contentPadding: EdgeInsets.zero),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Landmark";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            autofillHints: const [AutofillHints.streetAddressLevel2],
                            onSaved: (value) {
                              controller.landmark = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.pincodeController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Pincode",
                              labelStyle: TextStyle(fontSize: 15),
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.number, // Set keyboard type to allow only numeric input
                            autofillHints: const [AutofillHints.postalCode],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Pin Code";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              if (value != null && value.isNotEmpty) {
                                controller.pinCode = int.parse(value);
                              } else {
                                controller.pinCode = 0; // Default value in case the input is empty
                              }
                            },
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.cityController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                labelText: "City",
                                labelStyle: TextStyle(fontSize: 15),
                                contentPadding: EdgeInsets.zero),
                            keyboardType: TextInputType.streetAddress,
                            autofillHints: const [AutofillHints.addressCity],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter City";
                              }
                              return null;
                            },

                            onSaved: (value) {
                              controller.city = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: TextFormField(
                            controller: controller.stateController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                labelText: "State",
                                labelStyle: TextStyle(fontSize: 15),
                                contentPadding: EdgeInsets.zero),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter State";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            autofillHints: const [AutofillHints.addressState],
                            onSaved: (value) {
                              controller.state = value;
                            },
                          )),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.formKey.currentState!.save();
                            controller.saveAddress();
                          }
                        },
                        child: const Text("Save Address"),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
