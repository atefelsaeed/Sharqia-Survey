import 'package:flutter/material.dart';

import 'occupation_model.dart';
import 'personal_question.dart';

class PersonModel {
  PersonalHeadData? personalHeadData;
  OccupationModel? occupationModel;
  PersonalQuestion? personalQuestion;
  TextEditingController personName = TextEditingController();
  Map<String, dynamic> travelWithOther =  {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
    [
      {"value": 'نعم', "isChick": false},
      {"value": 'لا', "isChick": false},
    ],
    "index": 0
  };
  Map<String, dynamic> nationality = {
    "QPurposeOfBeingThere": [
      {"value": 'سعودي', "isChick": false},
      {"value": 'وافد عربي', "isChick": false},
      {"value": 'وافد اجنبي', "isChick": false},
    ],
    "title": "nationality",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "index": 0,
  };

  PersonModel({
    this.personalQuestion,
    this.occupationModel,
    required this.nationality,
    required this.travelWithOther,
    this.personalHeadData,
    required this.personName,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    personalHeadData = PersonalHeadData.fromJson(json['personalHeadData']);
    occupationModel = OccupationModel.fromJson(json['occupationModel']);
    personalQuestion = PersonalQuestion.fromJson(json['personalQuestion']);
    personName.text = json['personName'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['personName'] = personName.text;
    data['personalHeadData'] = personalHeadData!.toJson();
    data['occupationModel'] = occupationModel!.toJson();
    data['personalQuestion'] = personalQuestion!.toJson();

    return data;
  }
}

class PersonalHeadData {
  String? relationshipHeadHHS;
  String? gender;
  bool? checkAge;
  bool? refuseToTellAge;
  bool hasPasTrip = false;
  TextEditingController hhsHavePastTrip = TextEditingController();
  TextEditingController age = TextEditingController();
  String? nationalityType;
  TextEditingController nationality =
      TextEditingController(); //open if not سعودي
  bool showText = false;

  PersonalHeadData({
    required this.age,
    this.nationalityType,
    required this.hasPasTrip,
    required this.showText,
    required this.hhsHavePastTrip,
    required this.nationality,
    this.gender,
    this.checkAge,
    this.refuseToTellAge,
    this.relationshipHeadHHS,
  });

  PersonalHeadData.fromJson(Map<String, dynamic> json) {
    relationshipHeadHHS = json['relationshipHeadHHS'] ?? "";
    gender = json['gender'] ?? "";
    // checkAge = json['checkAge'];
    refuseToTellAge = json['refuseToTellAge'];
    age.text = json['age'] ?? "";
    nationalityType = json['nationalityType'] ?? "";
    nationality.text = json['nationality'] ;
    hhsHavePastTrip.text = json['hhsHavePastTrip'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['relationshipHeadHHS'] = relationshipHeadHHS ?? "";
    data['gender'] = gender ?? "";
    // data['checkAge'] = checkAge;
    data['refuseToTellAge'] = refuseToTellAge;
    data['age'] = age.text;
    data['nationalityType'] = nationalityType ?? "";
    data['nationality'] = nationality.text;
    data['hhsHavePastTrip'] = hhsHavePastTrip.text;
    return data;
  }
}
