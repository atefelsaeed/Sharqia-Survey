import 'package:sharqia_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';

class EmptyTrips {
  static emptyTrips() {
    //  personTrip = [];
    TripModeList.tripModeList[0].purposeOfBeingThere = {
      "QPurposeOfBeingThere": [
        {"value": ' في المنزل', "isChick": false},
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
    TripModeList.tripModeList[0].purposeOfBeingThere2 = {
      "TripReason": [
        {"value": ' في المنزل', "isChick": false},
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
    TripModeList.tripModeList[0].travelWithOther = {
      'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
          [
        {"value": 'مع الأخرين', "isChick": false},
        {"value": 'بمفردك', "isChick": false},
      ],
      "index": 0
    };
    for (var element in TripModeList.tripModeList) {
      //==============Reset-List=================
      element.hhsMembersTraveled = [];
      element.isHome = false;
      element.isHomeEnding = false;
      element.person = [];
      element.chosenFriendPerson = [];
      element.friendPerson = {};
      element.chosenPerson = '';
      element.departureTime.text = '';
      element.isTravelAlone = null;
      element.otherWhereDidYouParkEditingControl.text = '';
      element.taxiTravelTypeEditingControl.text = '';
      element.arrivalDepartTime.departTime.text = '';
      element.arrivalDepartTime.arriveDestinationTime.text = '';
      element.arrivalDepartTime.numberRepeatTrip = '';
      element.tripReason = '';
      element.purposeTravel = '';
      element.typeTravel = '';
      element.type = false;
      //============travelTypeModel=======================
      element.travelTypeModel.travelType = '';
      element.travelTypeModel.taxiTravelType = '';
      element.travelTypeModel.taxiFare.text = '';
      element.travelTypeModel.carParkingPlace = '';
      element.travelTypeModel.publicTransportFare = '';
      element.travelTypeModel.passTravelType = '';
      element.travelTypeModel.otherWhereDidYouParking.text = '';
      element.travelTypeModel.taxiTravelTypeOther.text = '';
      //================travelWay===============
      element.travelWay?.mainMode = '';
      element.travelWay?.accessMode = '';
      //================travelAloneHouseHold================
      element.travelAloneHouseHold?.childrenNumber.text = '';
      element.travelAloneHouseHold?.adultsNumber.text = '';
      element.travelAloneHouseHold?.text = '';
      //================travelWithOtherModel================
      element.travelWithOtherModel?.childrenNumber.text = '';
      element.travelWithOtherModel?.adultsNumber.text = '';
      element.travelWithOtherModel?.text = '';
      //===============startBeginningModel=============
      element.startBeginningModel?.tripAddressLat = '';
      element.startBeginningModel?.tripAddressLong = '';
      element.startBeginningModel?.area.text = '';
      element.startBeginningModel?.block.text = '';
      element.startBeginningModel?.nearestLandMark.text = '';
      element.startBeginningModel?.streetName.text = '';
      element.startBeginningModel?.streetNumber.text = '';
      //===========endingAddress=================
      element.endingAddress?.tripAddressLat = '';
      element.endingAddress?.tripAddressLong = '';
      element.endingAddress?.area.text = '';
      element.endingAddress?.block.text = '';
      element.endingAddress?.nearestLandMark.text = '';
      element.endingAddress?.streetName.text = '';
      element.endingAddress?.streetNumber.text = '';
      //============Reset-Checkbox==============================
      element.travelWithOther[element.travelWithOther.keys.first]!
          .toList()[element.travelWithOther["index"]]["isChick"] = false;

      element.purposeOfBeingThere2[element.purposeOfBeingThere2.keys.first]!
              .toList()[element.purposeOfBeingThere2["chosenIndex"]]
          ["isChick"] = false;

      element.purposeOfBeingThere[element.purposeOfBeingThere.keys.first]!
              .toList()[element.purposeOfBeingThere["chosenIndex"]]["isChick"] =
          false;

      // element.friendPerson[element.friendPerson.keys.first]!
      //     .toList()[element.friendPerson["index"]]["isChick"] = false;
    }
    TripModeList.tripModeList.length = 1;
  }
}
