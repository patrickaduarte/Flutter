import 'dart:io';
import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:task_list/models/assignment.dart';

class DbHelper{
  static final DbHelper _instance = new DbHelper.internal();

  factory DbHelper() => _instance;

  final String tableName = "taskTable";
  final String columnId = "id";
  final String columnTaskName = "name";
  final String columnTaskCreateDate = "date";
  
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  DbHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "tasks_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnTaskName TEXT, $columnTaskCreateDate TEXT);"
    );
  }

  //INSERT TASK
  Future<int> saveTask(Assignment item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", item.toMap());
    return res;
  }

  //GET TASK
  Future<List> listTasks() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
      "SELECT * FROM $tableName ORDER BY $columnTaskName ASC;"
    );
    return res.toList();
  }

  //COUNT TASKS
  Future<int> countTask() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName;") 
    );
  }

  //GET TASK SPECIFIC
  Future<Assignment> getTask(int id) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
      "SELECT * FROM $tableName WHERE id = $id;"
    );
    if(res.length == 0) return null;
    return new Assignment.fromMap(res.first);
  }

  //DELETE TASK
  Future<int> deleteTask(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableName, where: "$columnId = ?", whereArgs: [id]
    );
  }

  //UPDATE TASK
  Future<int> updateTask(Assignment item) async {
    var dbClient = await db;
    return await dbClient.update(
      tableName, item.toMap(), where: "$columnId = ?", whereArgs: [item.taskId]
    );
  }

  //CLOSE DATABASE
  Future closeDb() async {
    var dbClient = await db;
    return dbClient.close();
  }
  
}