import 'dart:io';

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
  final String columnPass = "password";

  static Database _db;
  Future<Database> get db async {
    if (_db != null){
      return _db;
    }
    _db = await initDb();
  }

  DataBaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "db_main.db");//home/directory/files/db_main.db

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY,"
    "$columnName TEXT,"
    "$columnPass TEXT,)");
  }

  //CRUD = CREATE, READ, UPDATE, DELETE
  
  //CREATE
  Future<int> createUser() async {

  }

}
