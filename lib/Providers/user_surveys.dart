import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Helper/api_routing.dart';
import '../Helper/locale_database/operations/hhs_user_surveys_operations.dart';
import '../Helper/locale_database/operations/survey_pt_operations.dart';
import '../Models/user_serveys_model.dart';
import '../Models/user_surves_status.dart';

class UserSurveysProvider with ChangeNotifier {
  List<Map<String, dynamic>> list = [];
  List<String> list2 = [''];

  bool iSSyncing = false;

  Future<bool> multiSync({callback, bool force = false}) async {
    iSSyncing = true;
    final surveysList = await SurveyPtOperations().getSurveyPtOfflineAllItems();
    debugPrint('Locale Offline DB Survey');
    debugPrint(surveysList.toString());
    for(var s in surveysList){
      list.add(s.toJsonAPI());
    }
    final Response res;
    try {
      // log("Body Data", error: json.encode(list));
      res = await APIHelper.postData(
        url: "multi",
        body:json.encode(list),
      );
      if (res.statusCode == 200) {
        await SurveyPtOperations().deleteSurveyPTTableOffline();
        debugPrint('Delete Survey Pt Offline All Items Done!');
      }
      iSSyncing = false;
      notifyListeners();
      // log("res", error: res.body);
    } catch (e) {
      iSSyncing = false;
      notifyListeners();
      return Future.error("couldn't reach server");
    }
    if (res.statusCode != 200) {
      notifyListeners();
      debugPrint("server refused");
      iSSyncing = false;
      notifyListeners();
      return Future.error("server refused");
    }
    if (callback != null) {
      callback();
    }
    iSSyncing = false;
    notifyListeners();
    return true;
  }

  List<UserSurveysModelData> _userSurveysSurveysList = [];
  UserSurveyStatusData? _userSurveyStatusData;

  UserSurveyStatusData? get userSurveyStatusData {
    return _userSurveyStatusData;
  }

  List<UserSurveysModelData> get userSurveys {
    return List<UserSurveysModelData>.from(_userSurveysSurveysList)
        .reversed
        .toList();
  }

  bool isSearching = false;
  List<UserSurveysModelData> searchList = [];
  List<UserSurveysModelData> hayList = [];
  List<UserSurveysModelData> qtaList = [];

  void searchHAY(String value) {
    hayList.clear();
    qtaList.clear();
    searchList.clear();
    for (var element in _userSurveysSurveysList) {
      if (element.haeno
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        hayList.add(element);
      }
    }
    debugPrint('searchHAY');
    debugPrint(hayList.length.toString());
    notifyListeners();
  }

  void searchQTA(String value) {
    qtaList.clear();
    searchList.clear();
    for (var element in hayList) {
      if (element.qta
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        qtaList.add(element);
      }
    }
    debugPrint('searchQTA');
    debugPrint(qtaList.length.toString());

    notifyListeners();
  }

  void searchBLOK(String value) {
    searchList.clear();
    for (var element in qtaList) {
      if (element.blok
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        searchList.add(element);
      }
    }
    debugPrint('searchBLOK');
    debugPrint(searchList.length.toString());
    notifyListeners();
  }

  void changeIcon() {
    isSearching = !isSearching;
    notifyListeners();
  }

  bool loading = false;
  int index = 0;

//============Fetch-All-User-Surveys-on-Search-Screen===============
  Future<bool> fetch(int id) async {
    try {
      loading = true;
      var response = await APIHelper.getData(
        url: "${APIRouting.getSurveis}$id",
      );
      print('res');
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (!data['status']) return false;
        _userSurveysSurveysList = (data['data'] as List)
            .map((e) => UserSurveysModelData.fromJson(e))
            .toList();
        await HHSUserSurveysOperations().deleteAuthTable();
        for (var element in _userSurveysSurveysList) {
          await HHSUserSurveysOperations().addItemToDatabase(element);
        }
        debugPrint('Add User Surveys to local database');
        loading = false;
        notifyListeners();
        return true;
      }
      loading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _userSurveysSurveysList = await HHSUserSurveysOperations().getAllItems();
      loading = false;
      notifyListeners();
      return true;
    }
  }

//==========Fetch-User-Survey-Status-on-Home-Screen=============
  Future<bool> fetchUserSurveysStatus(int id) async {
    try {
      loading = true;
      var response = await APIHelper.getData(
        url: "${APIRouting.userSurveysStatus}$id",
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // if (!data['status']) return false;
        _userSurveyStatusData = UserSurveyStatusData.fromJson(data['data']);
        debugPrint("fffff");
        debugPrint(_userSurveyStatusData?.allForms.toString());
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
          "userSurveysStatus",
          json.encode(_userSurveyStatusData),
        );
        loading = false;
        notifyListeners();
        return true;
      }
      loading = false;
      notifyListeners();
      return false;
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("userSurveysStatus")) return false;

      _userSurveyStatusData = UserSurveyStatusData.fromJson(
          json.decode(prefs.getString("userSurveysStatus")!));
      debugPrint("fffsssff");
      debugPrint(_userSurveyStatusData?.allForms.toString());
      loading = false;
      notifyListeners();
      return true;
    }
  }
}
