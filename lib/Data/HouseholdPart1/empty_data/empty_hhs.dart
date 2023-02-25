import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/hhs_models.dart';

import '../VechelisData/veh_model.dart';

class EmptyHHS {
  //==========HHS===================
  static emptyHSS() {
    HhsStatic.houseHold = [];
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
