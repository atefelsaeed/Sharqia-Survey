import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sharqia_household_survey/Helper/api_routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Helper/locale_database/locale_db.dart';
import '../Helper/locale_database/operations/auth_operations.dart';
import '../Models/user.dart';

class Auth with ChangeNotifier {
  bool _isAuth = false;
  List<User> _users = [];
  User? _user;
  DatabaseHelper db = DatabaseHelper();

  //User-Logout
  bool logout() {
    if (_user != null) {
      SharedPreferences.getInstance().then((value) {
        value.remove("user");
        _isAuth = false;
      });
      _user = null;
    }
    notifyListeners();
    return true;
  }

  bool get isAuth {
    return _isAuth;
  }

  int get uid {
    if (_isAuth) {
      return _user!.id;
    } else {
      return -1;
    }
  }

  User? get user {
    return _user;
  }

  Map<String, String> get authHeader {
    if (_isAuth) {
      return {"Authorization": "Bearer"};
    } else {
      return {};
    }
  }

  //Get-All-Users-Data
  Future<bool> fetch() async {
    try {
      var response = await APIHelper.getData(
        url: APIRouting.getUsers,
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        debugPrint("data:: $data");
        if (!data['status']) return false;
        _users = (data['data'] as List).map((e) => User.fromJson(e)).toList();
        await AuthOperations().deleteAuthTable();
        for (var element in _users) {
          await AuthOperations().addItemToDatabase(element);
        }
        return true;
      }
      return false;
    } catch (e) {
      _users = await AuthOperations().getAllItems();
      return true;
    }
  }

  //User-Login-Locale
  Future<bool> login(String? email, String? password) async {
    _isAuth = false;
    debugPrint("trying");
    for (var element in _users) {
      debugPrint(element.toJson().toString());
    }
    for (User u in _users) {
      if (u.email == email) {
        if (u.password == password) {
          _isAuth = true;
          _user = u;
          final prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "user",
            json.encode(_user?.toJson()),
          );
          notifyListeners();
          break;
        }
      }
    }
    return _isAuth;
  }

  Future<bool> tryAutoLogin() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("user")) return false;
    final userData = json.decode(prefs.getString("user")!);
    _user = User.fromJson(userData);
    _isAuth = true;
    notifyListeners();
    return true;
  }
}
