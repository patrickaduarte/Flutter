import 'dart:io';

import 'package:database_project/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = new DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;
  final String tableUser = "tableUser";
  final String columnId = "id";
  final String columnName = "name";
  final String columnPass = "pass";

  static Database _db;

  Future<Database> get db async {
    if (_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String way = join(documentDirectory.path, "db_main.db");//home/directory/files/db_main.db

    var ourDb = await openDatabase(way, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  void _onCreate(Database db, int version) async {
    await db.execute(
      """CREATE TABLE $tableUser(
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT,
        $columnPass TEXT
      );"""
    );
  }

  //CRUD = CREATE, READ, UPDATE, DELETE
  
  //CREATE USER
  Future<int> insertUser(User user) async {
    var dbClient = await db;

    int res = await dbClient.insert("$tableUser", user.toMap());
    return res;
  }

  //LIST USERS
  Future<List> takeUsers() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $tableUser");

    return res.toList();
  }

  //COUNT USERS
  Future<int> takeCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUser"));
  }

  //PICK UP SPECIFIC USER FROM ID
  Future<User> takeUser(int id) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $tableUser WHERE $columnId = $id");

    if(res.length == 0) return null;
    return new User.fromMap(res.first);
  }

  //DELETE USER
  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableUser, 
      where: "$columnId = ?", whereArgs: [id]
    );
  }
  
  //UPDATE USER
  Future<int> updateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update(tableUser,
      user.toMap(), where: "$columnId = ?", whereArgs: [user.id]
    );
  }

  //CLOSE DATABASE
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
