// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VendorModel {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String password;
  final String locality;
  final String role;
  VendorModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.password,
    required this.locality,
    required this.role,
  });

  //converting to map bcoz - we can easily convert to json, and this is bcox the
  // data will be sent to mongo db as json

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'city': city,
      'password': password,
      'locality': locality,
      'role': role,
    };
  }

  //converting to json becoz - the data will be sent with json
  String toJson() => json.encode(toMap());

  //converting back to the vendor user object so that we can make use of it within our app

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      password: map['password'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      role: map['role'] as String? ?? "",
    );
  }

  factory VendorModel.fromJson(String source) =>
      VendorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
