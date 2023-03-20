import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/user.dart';
import '../locale_db.dart';

class AuthOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add User to database
  Future<int> addItemToDatabase(User user) async {
    Database? myDB = await db.db;
    var raw = await myDB!.insert(
      DatabaseHelper.usersTableName,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('Add User To DB!');
    return raw;
  }

  Future<int> deleteAuthTable() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.usersTableName);
    debugPrint('Delete User To DB!');
    return raw;
  }

  //Get all users from the database
  Future<List<User>> getAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.usersTableName);
    List<User> list = response.map((c) => User.fromJson(c)).toList();
    debugPrint('Get-All Users from Database!');
    debugPrint(list.length.toString());
    return list;
  }
}
