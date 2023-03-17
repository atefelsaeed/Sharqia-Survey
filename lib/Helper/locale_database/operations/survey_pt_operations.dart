import 'dart:developer';

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
    SurveyPT list = await getSurveyPtAllItems();
    // await DatabaseHelper().close();
    int? raw;
    debugPrint("${list.id} && ${survey.id}");
    if (list.id != survey.id) {
      raw = await myDB!.insert(
        DatabaseHelper.surveyPTTableName,
        survey.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      raw = await update(survey);

      log(survey.toJson().toString());
    }

    debugPrint('Add Item To Survey PT Database');
    return raw;
  }

  //Update Survey PT Items
  Future<int> update(Survey survey) async {
    Database? myDB = await db.db;
    debugPrint('Update Item');
    return await myDB!.update(
      DatabaseHelper.surveyPTTableName,
      survey.toJson(),
      where: 'id = ?',
      whereArgs: [survey.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  //Get all survey PT Table from the database
  Future<SurveyPT> getSurveyPtAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableName);
    List<SurveyPT>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();
    if (list.isNotEmpty) {
      debugPrint('Get Survey PT DB');
      log(list.first.toJson().toString());
      debugPrint(list.length.toString());
      return list.first;
    } else {
      return SurveyPT();
    }
  }

  //Delete deleteSurveyPTTable
  Future<int> deleteSurveyPTTable() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.surveyPTTableName);
    debugPrint('Delete Survey PT Table');
    return raw;
  }

  //Add survey PT Table Offline to database
  Future<int> addItemToSurveyPtOfflineDatabase(Survey survey) async {
    Database? myDB = await db.db;
    debugPrint('Add Offline Survey PT to local database');
    var raw = await myDB!.insert(
      DatabaseHelper.surveyPTTableOfflineName,
      survey.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Delete deleteSurveyPTTableOffline
  Future<int> deleteSurveyPTTableOffline() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete("surveyPtOffline");
    debugPrint('Delete Survey PT Table Offline $raw');
    return raw;
  }

  //Get all survey PT Table Offline from the database
  Future<List<Survey>> getSurveyPtOfflineAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableOfflineName);
    List<Survey>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();
    debugPrint('Get Offline Survey PT to local database');
    return list;
  }
}
