import 'package:flutter/material.dart';

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
    adultsNumber.text = json['adultsNumber'];
    childrenNumber.text = json['childrenNumber'];
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
    mainMode = json['mainMode'];
    accessMode = json['accessMode'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['mainMode'] = mainMode;
    data['accessMode'] = accessMode;
    return data;
  }
}
