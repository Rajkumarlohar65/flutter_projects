// models/address_model.dart

class Address {
  String id;
  String name;
  String street;
  String landmark;
  String city;
  String state;
  int pinCode;
  String country;
  int mobileNumber;

  Address({
    required this.id,
    required this.name,
    required this.street,
    required this.landmark,
    required this.city,
    required this.state,
    required this.pinCode,
    required this.country,
    required this.mobileNumber,
  });
}
