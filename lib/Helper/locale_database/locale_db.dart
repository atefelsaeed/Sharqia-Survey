import 'dart:developer';

import 'package:sharqia_household_survey/Helper/locale_database/locale_db_querys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;
  static String databaseName = 'JaddahSurvey.db';
  static String surveyPTTableName = 'servey_p_t_s';
  static String surveyPTTableOfflineName = 'surveyPtOffline';
  static String usersTableName = 'users';
  static String surveysTableName = 'survies';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializedDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initializedDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, databaseName);
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(LocaleDBQueries.createSurveyPTTable);
    await db.execute(LocaleDBQueries.crateSurveysTable);
    await db.execute(LocaleDBQueries.crateUsersTable);
    await db.execute(LocaleDBQueries.createSurveyPTOfflineTable);
    log('CREATE DATABASE AND TABLE ====================================>');
  }

  Future<List<Map>> readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

  myDeleteDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, databaseName);
    await deleteDatabase(path);
  }

  deleteAllPersons() async {
    Database? mydb = await db;
    var response = await mydb!.delete("items");
    return response;
  }
}
