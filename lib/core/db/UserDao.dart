import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

class UserDao {
  final Database _db;

  UserDao(this._db);

  Future<int> insertUser(UserModel user) async {
    return await _db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserModel>> retrieveUsers() async {
    final List<Map<String, Object?>> queryResult =
        await _db.query('users', orderBy: 'id DESC');
    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }
Future<UserModel?> getUserById({int? id}) async {

    final List<Map<String, Object?>> queryResult = await _db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      orderBy: 'id DESC',
      limit: 1,
    );

    if (queryResult.isNotEmpty) {
      return UserModel.fromMap(queryResult.first);
    } else {
      return null;
    }
}
  Future<UserModel?> retrieveUser({String? email, String? password}) async {
    
    if (email!.isEmpty || password!.isEmpty) {
      return null;
    }

    final List<Map<String, Object?>> queryResult = await _db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      orderBy: 'id DESC',
      limit: 1,
    );

    if (queryResult.isNotEmpty) {
      return UserModel.fromMap(queryResult.first);
    } else {
      return null;
    }
  }

  Future<int> updateUser(int id, Map<String, dynamic> items) async {
    int result =
        await _db.update('users', items, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> deleteUser(int id) async {
    return await _db.delete('users', where: "id = ?", whereArgs: [id]);
  }
}
