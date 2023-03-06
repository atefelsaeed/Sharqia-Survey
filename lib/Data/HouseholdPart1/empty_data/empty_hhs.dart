import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/hhs_models.dart';

import '../HHSData/questions_data.dart';
import '../VechelisData/veh_model.dart';

class EmptyHHS {
  //==========HHS===================
  static emptyHSS() {
    HhsStatic.houseHold = [];
    QuestionsData.qh4={
      "? How many separate families live at this address": [
        {"value": '1', "isChick": false},
        {"value": '2', "isChick": false},
        {"value": '3', "isChick": false},
        {"value": '4', "isChick": false},
        {"value": '5', "isChick": false},
        {"value": '6', "isChick": false},
        {"value": '7', "isChick": false},
        {"value": '8', "isChick": false},
        {"value": '9', "isChick": false},
        {"value": '10', "isChick": false},
      ],
      "subTitle":
      " A separate family is defined as who share the kitchen expenses and meals",
      "index": 0
    };
    QuestionsData.qh7 = {
      "?How many years have you/your family lived at this particular address": [
        {"value": 'أقل من 1.5 سنة', "isChick": false}, //
        {"value": '1.5 - 3 سنوات', "isChick": false},
        {"value": '3 - 5 سنوات', "isChick": false},
        {"value": '5 - 10 سنوات', "isChick": false},
        {"value": '+10 سنوات', "isChick": false},
      ],
      "index": 0
    };
    QuestionsData.qh3= {
      "?How many bedrooms are there in the accommodation you live in": [
    {"value": '1', "isChick": false},
    {"value": '2', "isChick": false},
    {"value": '3', "isChick": false},
    {"value": '4', "isChick": false},
    {"value": '5', "isChick": false},
    {"value": '6', "isChick": false},
    {"value": '7', "isChick": false},
    {"value": '8', "isChick": false},
    {"value": '9', "isChick": false},
    {"value": '10', "isChick": false},
    {"value": '11', "isChick": false},
    {"value": '>12', "isChick": false},
    ],
    "subTitle":
    " A separate family is defined as who share the kitchen expenses and meals",
    "index": 0
    };
    HhsStatic.hhsElectricScooter = BikesType('', '', '');
    HhsStatic.hhsElectricCycles == BikesType('', '', '');
    HhsStatic.hhsPedalCycles == BikesType('', '', '');
    HhsStatic.householdQuestions = HouseholdQuestions(
      hhsPedalCycles: BikesType("", "", ""),
      hhsDwellingTypeOther: TextEditingController(),
      hhsIsDwellingOther: TextEditingController(),
      hhsNumberApartments: TextEditingController(),
      hhsElectricCycles: BikesType("", "", ""),
      hhsTotalIncome: '',
      hhsElectricScooter: BikesType("", "", ""),
      hhsNumberSeparateFamilies: "",
      hhsNumberYearsInAddress: "",
      hhsNumberBedRooms: TextEditingController(),
      hhsNumberFloors: TextEditingController(),
    );
    HhsStatic.householdQuestions.hhsNumberSeparateFamilies = '';
    HhsStatic.householdQuestions.hhsNumberYearsInAddress = '';
    HhsStatic.householdQuestions.hhsDwellingTypeOther!.text = '';
    HhsStatic.householdQuestions.hhsIsDwellingOther!.text = '';
    HhsStatic.householdAddress = HouseholdAddress(
      hhsPhone: TextEditingController(),
      hhsAddressLong: "",
      hhsAddressLat: "",
    );
    VehModel.editingController3.totalNumber.text = "";
    VehModel.nearestPublicTransporter = '';
  }
}
