import 'dart:ffi';

import 'package:flutter/material.dart';


class Ordermodel {
  int? id;
  String? Ambulance;
  String? lat;
  String? lac;
  String? image;
  int? orderStatus;
  int? user_id;

  Ordermodel({
    this.id,
    this.Ambulance,
    this.lat,
    this.lac,
    this.image,
    this.orderStatus,
    this.user_id,
   
  });

  Ordermodel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        Ambulance = map['ambulance'],
        lat = map['lat'],
        lac = map['lac'],
        image = map['image'],
        orderStatus = map['orderStatus'],
        user_id = map['user_id'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'ambulance': Ambulance,
      'orderStatus': orderStatus,
      'lac': lac,
      'lat': lat,
      'image': image,
      'user_id': user_id,
    };
  }
}
