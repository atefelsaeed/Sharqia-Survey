import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/hhs_models.dart';

import '../../../UI/Screens/Survey/actions/action_survey_screen.dart';
import '../../../UI/Screens/Survey/editing_controller.dart';
import '../HHSData/questions_data.dart';
import '../VechelisData/vechelis_data.dart';
import '../VechelisData/veh_model.dart';

class EmptyHHS {
  //==========HHS===================
  static emptyHSS() {
    HhsStatic.houseHold = [];
    QuestionsData.qh4 = {
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
    QuestionsData.qh3 = {
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
      hhsNumberShoppingTrip: TextEditingController(),
      hhsNumberHealthTrip: TextEditingController(),
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

  static resetHHS(context) {
    final provider = Provider.of<ActionSurveyProvider>(context, listen: false);
    provider.hasBicycle = false;
    provider.hasBicycleQ82 = false;
    provider.hasBicycleQ83 = false;

    EditingController editingController = EditingController();

    editingController.editingController3Q83.totalNumber.text = '';
    editingController.editingController3Q83.peopleUnder18.text = '';
    editingController.editingController3Q83.peopleAdults18.text = '';

    VehiclesData.q3VecData = {
      " How far is the nearest public transport bus stop from your home by walk (in minutes) ?":
          [
        {"value": '<5 دقائق سيرا على الأقدام', "isChick": false},
        {"value": '6-10 دقائق سيرا على الأقدام', "isChick": false},
        {"value": '11 - 15 دقيقة مشي', "isChick": false},
        {"value": ' أكثر من 15 دقيقة', "isChick": false},
        {"value": 'لا اعرف', "isChick": false},
        {"value": 'لا يوجد محطة', "isChick": false},
      ],
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
    QuestionsData.qh4 = {
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
    QuestionsData.qh3 = {
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
    QuestionsData.qh7_2 = {
      'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
          [
        {"value": 'نعم', "isChick": false},
        {"value": 'لا', "isChick": false},
      ],
      "index": 0
    };
  }
}
