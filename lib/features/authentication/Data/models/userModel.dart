import 'package:flutter/material.dart';

class UserModel {
  int? id;
  String fullName;
  String email;
  String password;
  String? address;
  int? role;
  String? phoneNumber; 
  int? userStatus;
  int cinc; 

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    this.address,
    this.role,
    this.phoneNumber,
    required this.cinc,
    this.userStatus,
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        fullName = map['fullName'] ?? '',
        email = map['email'] ?? '',
        password = map['password'] ?? '',
        address = map['address'],
        phoneNumber = map['phoneNumber']?.toString(), // Ensure phoneNumber is handled as String
        role = map['role'],
        userStatus = map['userStatus'],
        cinc = map['cinc'] ?? 0; // Ensure cinc is handled correctly

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'address': address,
      'role': role,
      'phoneNumber': phoneNumber,
      'userStatus': userStatus,
      'cinc': cinc,
    };
  }
}
