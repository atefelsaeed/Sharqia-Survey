import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/user_serveys_model.dart';
import '../locale_db.dart';

class HHSUserSurveysOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add UserSurveys to database
  Future<int> addItemToDatabase(
      UserSurveysModelData userSurveysModelData) async {
    Database? myDB = await db.db;

    var raw = await myDB!.insert(
      DatabaseHelper.surveysTableName,
      userSurveysModelData.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
  Future<int> deleteAuthTable() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.surveysTableName);
    return raw;
  }
  //Get all UserSurveys from the database
  Future<List<UserSurveysModelData>> getAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveysTableName);
    List<UserSurveysModelData> list =
        response.map((c) => UserSurveysModelData.fromJson(c)).toList();
    debugPrint('Get User Surveys local database');
    debugPrint(list.length.toString());
    return list;
  }
}
