import 'package:flutter/material.dart';

import '../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../Models/Trips_SurveyModel/travel_type_model.dart';
import '../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../Models/Trips_SurveyModel/trips_model.dart';

class TripModeList {
  static List<TripsModel> tripModeList = [
    TripsModel(
      mainPerson: [],
      chosenPerson: '',
      isTravelAlone: null,
      purposeOfBeingThere2: {
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
          // {"value": 'توص الى المدرسة / التعليم', "isChick": false},
          {"value": 'توصيل الى مكان آخر', "isChick": false},
          // {"value": 'توص الى مكان آخر', "isChick": false},
          {"value": 'آخرى', "isChick": false},
        ],
        "title": "?What was the purpose of being there",
        "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
        "chosenIndex": 0,
      },
      purposeOfBeingThere: {
        "QPurposeOfBeingThere": [
          {"value": 'في المنزل', "isChick": false},
          {"value": 'فى بيت العطلات / الفندق', "isChick": false},
          {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
          {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
          {"value": 'مكان تعليمى', "isChick": false},
          {"value": 'التسوق', "isChick": false},
          {"value": 'عمل شخصي', "isChick": false},
          // {"value": 'توص الى المدرسة / التعليم', "isChick": false},
          // {"value": 'توص الى مكان آخر', "isChick": false},
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
      },
      person: [],
      travelWithOther: {
        'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
            [
          {"value": 'مع الأخرين', "isChick": false},
          {"value": 'بمفردك', "isChick": false},
        ],
        "index": 0
      },
      type: false,
      isHome: false,
      isHomeEnding:false,
      tripReason: "",
      // person: [],
      purposeTravel: "",
      // newPerson: [],
      // chosenPerson: '',
      otherWhereDidYouParkEditingControl: TextEditingController(),
      taxiTravelTypeEditingControl: TextEditingController(),
      departureTime: TextEditingController(),
      typeTravel: '',
      typeTravelCondition: "0",
      travelTypeModel: TravelTypeModel(
        carParkingPlace: "",
        ticketSub: TextEditingController(),
        taxiTravelTypeOther: TextEditingController(),
        otherWhereDidYouParking: TextEditingController(),
        taxiFare: TextEditingController(),
        taxiTravelType: '',
        travelType: '',
        passTravelType: '',
        publicTransportFare: '',
      ),
      travelWay: TravelWay(
        mainMode: "",
        accessMode: "",
      ),
      hhsMembersTraveled: [],
      travelWithOtherModel: TravelWithOtherModel(
          adultsNumber: TextEditingController(),
          childrenNumber: TextEditingController(),
          text: "إذا كان مع الآخرین كم أعمارھم؟"),
      travelAloneHouseHold: TravelWithOtherModel(
          adultsNumber: TextEditingController(),
          childrenNumber: TextEditingController(),
          text: "اي من أفراد الأسرة ذهب معك؟"),
      arrivalDepartTime: ArrivalDepartTime(
        arriveDestinationTime: TextEditingController(),
        departTime: TextEditingController(),
        numberRepeatTrip: '',
      ),
      startBeginningModel: StartBeginningModel(
        tripAddressLat: "",
        tripAddressLong: "",
        area: TextEditingController(),
        block: TextEditingController(),
        nearestLandMark: TextEditingController(),
        streetName: TextEditingController(),
        streetNumber: TextEditingController(),
      ),
      endingAddress: StartBeginningModel(
        tripAddressLat: "",
        tripAddressLong: "",
        area: TextEditingController(),
        block: TextEditingController(),
        nearestLandMark: TextEditingController(),
        streetName: TextEditingController(),
        streetNumber: TextEditingController(),
      ),
      chosenFriendPerson: [],
    ),
  ];
}
