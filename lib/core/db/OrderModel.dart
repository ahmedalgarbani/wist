import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class OrderDao {
  final Database _db;

  OrderDao(this._db);

  Future<int> insertOrder(Ordermodel user) async {
    return await _db.insert('orders', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Ordermodel>> retrieveOrders() async {
    final List<Map<String, Object?>> queryResult = await _db.query('orders',orderBy:'id DESC');
    return queryResult.map((e) => Ordermodel.fromMap(e)).toList();
  }

   Future<List<Ordermodel>> retrieveOrder({String? orderStatus}) async {
  final List<Map<String, Object?>> queryResult = await _db.query(
    'orders',
    where: 'orderStatus = ?',
    whereArgs: [orderStatus],
    orderBy: 'id DESC',
  );
  return queryResult.map((e) => Ordermodel.fromMap(e)).toList();
}
   Future<List<Ordermodel>> retrieveOrdersuser({String? user_id}) async {
  final List<Map<String, Object?>> queryResult = await _db.query(
    'orders',
    where: 'user_id = ?',
    whereArgs: [user_id],
    orderBy: 'id DESC',
  );
  return queryResult.map((e) => Ordermodel.fromMap(e)).toList();
}


  Future<int> updateOrder(int id, Map<String, dynamic> items) async {
    int result =
        await _db.update('orders', items, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> deleteOrder(int id) async {
    return await _db.delete('orders', where: "id = ?", whereArgs: [id]);
  }
}
