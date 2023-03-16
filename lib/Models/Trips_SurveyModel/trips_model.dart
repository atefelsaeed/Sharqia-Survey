import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';
import 'package:sharqia_household_survey/Models/Trips_SurveyModel/travel_type_model.dart';
import 'package:sharqia_household_survey/Models/Trips_SurveyModel/travel_with_other_model.dart';

class PersonModelFirends {
  String value;
  int id;

  PersonModelFirends(this.value, this.id);
}

class TripsModel {
  bool? type;
  StartBeginningModel? startBeginningModel;
  String? typeTravelCondition;
  String? typeTravel;
  StartBeginningModel? endingAddress;
  TextEditingController otherWhereDidYouParkEditingControl =
      TextEditingController();
  TextEditingController taxiTravelTypeEditingControl = TextEditingController();
  List<String> person = [];
  List<String> mainPerson = [];
  List<dynamic> chosenFriendPerson = [];
  String chosenPerson = "";
  Map friendPerson = {
    "friendPerson": [
      {"value": '', "isChick": false},
    ],
    "title": "friendPerson",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "index": 0,
  };

  Map<String, dynamic> travelWithOther = {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
        [
      {"value": 'مع الأخرين', "isChick": false},
      {"value": 'بمفردك', "isChick": false},
    ],
    "index": 0
  };
  Map<String, dynamic> purposeOfBeingThere = {
    "QPurposeOfBeingThere": [
      {"value": 'في المنزل', "isChick": false},
      {"value": 'فى بيت العطلات / الفندق', "isChick": false},
      {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
      {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
      {"value": 'مكان تعليمى', "isChick": false},
      {"value": 'التسوق', "isChick": false},
      {"value": 'عمل شخصي', "isChick": false},
      {"value": 'طبى / مستشفى', "isChick": false},
      {"value": 'زیارة الأصدقاء / الأقارب', "isChick": false},
      {"value": 'ترفيه / وقت الفراغ', "isChick": false},
      {"value": 'توصيل الى المدرسة / التعليم', "isChick": false},
      {"value": 'توصيل الى مكان آخر', "isChick": false},
      {"value": 'آخرى', "isChick": false},
    ],
    "title": "?What was the purpose of being there",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };
  Map<String, dynamic> purposeOfBeingThere2 = {
    "TripReason": [
      {"value": 'في المنزل', "isChick": false},
      {"value": 'فى بيت العطلات / الفندق', "isChick": false},
      {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
      {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
      {"value": 'مكان تعليمى', "isChick": false},
      {"value": 'التسوق', "isChick": false},
      {"value": 'عمل شخصي', "isChick": false},
      {"value": 'طبى / مستشفى', "isChick": false},
      {"value": 'زیارة الأصدقاء / الأقارب', "isChick": false},
      {"value": 'ترفيه / وقت الفراغ', "isChick": false},
      {"value": 'توصيل الى المدرسة / التعليم', "isChick": false},
      {"value": 'توصيل الى مكان آخر', "isChick": false},
      {"value": 'آخرى', "isChick": false},
    ],
    "title": "?What was the purpose of being there",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };
  late bool showFriend = false;
  String? purposeTravel;
  TextEditingController departureTime = TextEditingController();

  String? tripReason;
  TravelWay? travelWay;

  bool? isTravelAlone;

  TravelWithOtherModel? travelWithOtherModel = TravelWithOtherModel(
      adultsNumber: TextEditingController(),
      childrenNumber: TextEditingController());

  TravelWithOtherModel? travelAloneHouseHold = TravelWithOtherModel(
      adultsNumber: TextEditingController(),
      childrenNumber: TextEditingController());

  List<dynamic>? hhsMembersTraveled;

  ArrivalDepartTime arrivalDepartTime = ArrivalDepartTime(
      departTime: TextEditingController(),
      arriveDestinationTime: TextEditingController());

  TravelTypeModel travelTypeModel = TravelTypeModel(
    taxiFare: TextEditingController(),
    ticketSub: TextEditingController(),
    taxiTravelTypeOther: TextEditingController(),
    otherWhereDidYouParking: TextEditingController(),
  );
  bool isHome = false;
  bool isHomeEnding = false;

  TripsModel({
    required this.person,
    required this.mainPerson,
    required this.isHome,
    required this.isHomeEnding,
    required this.chosenFriendPerson,
    required this.chosenPerson,
    this.type,
    required this.purposeOfBeingThere,
    required this.travelWithOther,
    this.hhsMembersTraveled,
    required this.travelTypeModel,
    this.typeTravel,
    required this.otherWhereDidYouParkEditingControl,
    this.typeTravelCondition,
    this.travelWithOtherModel,
    required this.taxiTravelTypeEditingControl,
    this.travelAloneHouseHold,
    required this.arrivalDepartTime,
    this.travelWay,
    required this.purposeOfBeingThere2,
    required this.departureTime,
    this.endingAddress,
    this.isTravelAlone,
    this.purposeTravel,
    this.startBeginningModel,
    this.tripReason,
  });

  TripsModel.fromJson(Map<String, dynamic> json) {
    startBeginningModel =
        StartBeginningModel.fromJson(json['startBeginningModel']);
    endingAddress = StartBeginningModel.fromJson(json['endingAddress']);
    travelWay = TravelWay.fromJson(json['travelWay']);
    travelWithOtherModel =
        TravelWithOtherModel.fromJson(json['travelWithOtherModel']);
    travelAloneHouseHold =
        TravelWithOtherModel.fromJson(json['travelAloneHouseHold']);
    arrivalDepartTime = ArrivalDepartTime.fromJson(json['arrivalDepartTime']);
    travelTypeModel = TravelTypeModel.fromJson(json['travelTypeModel']);
    purposeTravel = json['purposeTravel'] ??
        purposeOfBeingThere["QPurposeOfBeingThere"][0]["value"];
    chosenPerson = json['ownerTripPerson'] ?? '';
    departureTime.text = json['departureTime'] ?? '';
    tripReason =
        json['tripReason'] ?? purposeOfBeingThere2["TripReason"][0]["value"];
    isTravelAlone = json['isTravelAlone'];
    print(json["hhsMembersTraveled"]);

    chosenFriendPerson = List.from(json["hhsMembersTraveled"]);
    //  List<String>.from(json["hhsMembersTraveled"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['startBeginningModel'] = startBeginningModel!.toJson();
    data['endingAddress'] = endingAddress!.toJson();
    data['travelWay'] = travelWay!.toJson();
    data['travelWithOtherModel'] = travelWithOtherModel!.toJson();
    data['travelAloneHouseHold'] = travelAloneHouseHold!.toJson();
    data['arrivalDepartTime'] = arrivalDepartTime.toJson();
    data['travelTypeModel'] = travelTypeModel.toJson();
    data['purposeTravel'] = purposeTravel;
    data['ownerTripPerson'] = chosenPerson;
    data['departureTime'] = departureTime.text;
    data['tripReason'] = tripReason;
    data['isTravelAlone'] = isTravelAlone;
    data['hhsMembersTraveled'] = chosenFriendPerson.map((e) => e).toList();
    return data;
  }
}
