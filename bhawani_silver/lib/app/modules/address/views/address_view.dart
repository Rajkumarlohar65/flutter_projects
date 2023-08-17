import 'package:BhawaniSilver/app/core/values/app_color.dart';
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
      appBar: AppBar(title: const Text("Enter Address", style: TextStyle(color: AppColor.whiteColor),),),
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
                          value: controller.country, // Set the currently selected value
                          onChanged: (newValue) {
                            controller.country = newValue; // Update the selected value
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
                          items: ['India'] // Replace with your list of countries
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
                          child: TextFormField(
                            controller: controller.mobileNumberController,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Mobile Number",
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
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Street",
                            ),
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
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: "LandMark",
                            ),
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
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Pincode",
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
                              fontSize: 15,
                            ),
                            decoration: const InputDecoration(
                              labelText: "City/Town",
                            ),
                            keyboardType: TextInputType.streetAddress,
                            autofillHints: const [AutofillHints.addressCity],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter City/Town";
                              }
                              return null;
                            },

                            onSaved: (value) {
                              controller.city = value;
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                        child: DropdownButtonFormField<String>(
                          value: controller.state, // Set the currently selected value
                          onChanged: (newValue) {
                            controller.state = newValue; // Update the selected value
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

                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.formKey.currentState!.save();
                              controller.saveAddress();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(AppColor.yellowColor),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColor.blackColor),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(double.infinity, 50))),
                          child: const Text("Save Address"),
                        ),
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
