import 'package:flutter/material.dart';

import '../../Data/HouseholdPart1/TripsData/trip_data.dart';

class TravelWithOtherModel {
  TextEditingController adultsNumber = TextEditingController();
  TextEditingController childrenNumber = TextEditingController();

  String? text;

  TravelWithOtherModel({
    required this.adultsNumber,
    required this.childrenNumber,
    this.text,
  });

  TravelWithOtherModel.fromJson(Map<String, dynamic> json) {
    adultsNumber.text = json['adultsNumber']??'0'; //json['adultsNumber'];
    childrenNumber.text = json['childrenNumber']??'0'; //json['childrenNumber'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['adultsNumber'] = adultsNumber.text;
    data['childrenNumber'] = childrenNumber.text;
    return data;
  }
}

class AdultsModel {
  TextEditingController adultsPlus18 = TextEditingController();
  TextEditingController adultsMin18 = TextEditingController();
  final String text;

  AdultsModel(
      {required this.adultsPlus18,
      required this.adultsMin18,
      required this.text});
}

class TravelWay {
  String? mainMode;
  String? accessMode;

  TravelWay({
    this.mainMode,
    this.accessMode,
  });

  TravelWay.fromJson(Map<String, dynamic> json) {
    mainMode = json['mainMode']?? TripData.mainMade['mainMade'][0];
    accessMode = json['accessMode'] ?? TripData.AcMode['AcMode'][0];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['mainMode'] = mainMode;
    data['accessMode'] = accessMode;
    return data;
  }
}
