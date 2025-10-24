import 'package:path/path.dart';
import 'package:ppkd_batch4/models/user_model.dart';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableUser = 'users';
  // static const tableStudent = 'students';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'ppkd.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, number INTEGER, country TEXT, password TEXT)",
        );
        // await db.execute(
        //   "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, number INTEGER, country TEXT, password TEXT)",
        // );
      },

      // onUpgrade: (db, oldVersion, newVersion) async {
      //   if (newVersion == 2) {
      //     await db.execute(
      //       "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, number INTEGER, country TEXT, password TEXT)",
      //     );
      //   }
      // },
      version: 1,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    print(user.toJson());
    await dbs.insert(
      tableUser,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<UserModel?> loginUser({
    required String username,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  //MENAMBAHKAN SISWA
  // static Future<void> createStudent(StudentModel student) async {
  //   final dbs = await db();
  //   //Insert adalah fungsi untuk menambahkan data (CREATE)
  //   await dbs.insert(
  //     tableStudent,
  //     student.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //   print(student.toMap());
  // }

  // GET User
  static Future<List<UserModel>> getAllUser() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableUser);
    print(results.map((e) => UserModel.fromMap(e)).toList());
    return results.map((e) => UserModel.fromMap(e)).toList();
  }
}
