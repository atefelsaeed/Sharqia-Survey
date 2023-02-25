import 'package:flutter/cupertino.dart';

import '/providers/survey.dart';
import '../Data/Enums/hhs_enums.dart';
import 'HHS_SurvyModels/hhs_models.dart';

class HeaderBase {
  late double locationLat;
  late double locationLong;
  late DateTime interviewDate;
  int? interviewNumber;

  String? districtName;
  late String zoneNumber;
  late int empNumber;
  HouseholdAddress householdAddress = HouseholdAddress(
    hhsPhone: TextEditingController(),
  );

  HeaderBase();
}

abstract class Survey {
  String id = "";
  late HeaderBase header;
  final SurveyType type;
  bool synced = false;
  late SurveyProvider provider;

  Survey(this.type);

  set suggestionName(String suggestionName) {}

  Map<String, dynamic> toJson();
  Map<String, dynamic> toJsonAPI();

  fromJson(Map<String, dynamic> json);
}
