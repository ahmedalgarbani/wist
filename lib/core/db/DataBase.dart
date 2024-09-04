import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wist/core/db/OrderModel.dart';
import 'package:wist/core/db/UserDao.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class AbmulanceDatabase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'ambulance.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL, address TEXT NOT NULL, role Integer NULL, cinc INTEGER NULL,userstatus INTEGER NULL,phonenumber INTEGER NULL)",
        );
        await db.execute(
          "CREATE TABLE orders(id INTEGER PRIMARY KEY AUTOINCREMENT, ambulance TEXT NOT NULL, lat TEXT NULL, lac TEXT NULL, image TEXT NULL,orderstatus TEXT NULL, user_id INTEGER NULL, FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE)",
        );
      },
    );
  }

  Future<UserDao> userDao() async {
    final db = await initializedDB();
    return UserDao(db);
  }

  Future<OrderDao> orderDao() async {
    final db = await initializedDB();
    return OrderDao(db);
  }
}
