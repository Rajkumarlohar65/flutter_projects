import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/widgets/button_widget/address_saveAddressButton_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/address_city_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/address_landmark_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/address_mobileNumber_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/address_pincode_widget.dart';
import 'package:BhawaniSilver/app/widgets/text_form_field_widget/address_street_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Address",
          style: TextStyle(color: AppColor.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        child: DropdownButtonFormField<String>(
                          value: controller
                              .country, // Set the currently selected value
                          onChanged: (newValue) {
                            controller.country =
                                newValue; // Update the selected value
                          },
                          decoration: const InputDecoration(
                            labelText: "Country",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Select a country"; // Update the validation message
                            }
                            return null;
                          },
                          items:
                              ['India'] // Replace with your list of countries
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: const AddressMobileNumberWidget()),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: const AddressStreetWidget()),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: const AddressLandmarkWidget()),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: const AddressPincodeWidget()),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: const AddressCityWidget()),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                        child: DropdownButtonFormField<String>(
                          value: controller
                              .state, // Set the currently selected value
                          onChanged: (newValue) {
                            controller.state =
                                newValue; // Update the selected value
                          },
                          decoration: const InputDecoration(
                            labelText: "State",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Select a state"; // Update the validation message
                            }
                            return null;
                          },
                          items: [
                            'Andhra Pradesh',
                            'Arunachal Pradesh',
                            'Assam',
                            'Bihar',
                            'Chhattisgarh',
                            'Goa',
                            'Gujarat',
                            'Haryana',
                            'Himachal Pradesh',
                            'Jharkhand',
                            'Karnataka',
                            'Kerala',
                            'Madhya Pradesh',
                            'Maharashtra',
                            'Manipur',
                            'Meghalaya',
                            'Mizoram',
                            'Nagaland',
                            'Odisha',
                            'Punjab',
                            'Rajasthan',
                            'Sikkim',
                            'Tamil Nadu',
                            'Telangana',
                            'Tripura',
                            'Uttar Pradesh',
                            'Uttarakhand',
                            'West Bengal',
                          ] // Replace with your list of states
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          menuMaxHeight: 500,
                        ),
                      ),
                      const AddressSaveAddressButtonWidget()
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
