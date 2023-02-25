import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../../../Models/survey.dart';
import '../locale_db.dart';

class SurveyPtOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add survey PT Table to database
  Future<int?> addItemToSurveyPtDatabase(Survey survey) async {
    Database? myDB = await db.db;
    List<SurveyPT> list = await getSurveyPtAllItems();
    int? raw;
    if (list.isNotEmpty) {
      list.removeWhere((element) => element.id == survey.id);
      raw = await myDB!.insert(
        DatabaseHelper.surveyPTTableName,
        survey.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      raw = await myDB!.insert(
        DatabaseHelper.surveyPTTableName,
        survey.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    debugPrint('addItemToSurveyPtDatabase');
    return raw;
  }

  //Get all survey PT Table from the database
  Future<List<SurveyPT>> getSurveyPtAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableName);
    List<SurveyPT>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();
    debugPrint('local data base');
    debugPrint(list.toString());
    return list;
  }

  //Add survey PT Table Offline to database
  Future<int> addItemToSurveyPtOfflineDatabase(Survey survey) async {
    Database? myDB = await db.db;
    debugPrint('Add Survey PT to local database');
    var raw = await myDB!.insert(
      DatabaseHelper.surveyPTTableOfflineName,
      survey.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    //Add Item To Survey PT to Local Database.
    // await addItemToSurveyPtDatabase(survey);
    return raw;
  }

  //Delete deleteSurveyPTTableOffline
  Future<int> deleteSurveyPTTableOffline() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.surveyPTTableOfflineName);
    return raw;
  }

  //Get all survey PT Table Offline from the database
  Future<List<Survey>> getSurveyPtOfflineAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableOfflineName);
    List<Survey>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();
    debugPrint('Get Survey PT to local database');
    return list;
  }
}
