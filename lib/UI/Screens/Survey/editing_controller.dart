import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/user_surveys.dart';
import 'actions/action_survey_screen.dart';

class EditingController {

  final TextEditingController yes = TextEditingController();

  final TextEditingController peopleAdults18 = TextEditingController();
  final TextEditingController peopleUnder18 = TextEditingController();

  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  EditingController3 editingController3Q81 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q82 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q83 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());
}

c(EditingController editingController, BuildContext context, int id) async {
  UserSurveysProvider surveyPt =
      Provider.of<UserSurveysProvider>(context, listen: false);

  final validationService =
      Provider.of<ActionSurveyProvider>(context, listen: false);

  await surveyPt.getSurveyByID(id, context);

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

  ///header phone
  HhsStatic.householdAddress.hhsPhone.text =
      surveyPt.surveyPT.header.householdAddress.hhsPhone.text;

  ///Q1 hhsDwellingType
  // debugPrint(       surveyPt.surveyPT!.householdQuestions.hhsDwellingType.toString());
  HhsStatic.householdQuestions.hhsDwellingTypeOther!.text =
      surveyPt.surveyPT.householdQuestions.hhsDwellingType.toString();
  HhsStatic.householdQuestions.hhsDwellingType =
      surveyPt.surveyPT.householdQuestions.hhsDwellingType.toString(); //solve

  HhsStatic.householdQuestions.hhsNumberApartments.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberApartments.text;

  HhsStatic.householdQuestions.hhsNumberFloors.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberFloors.text;

  HhsStatic.householdQuestions.hhsNumberBedRooms.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberBedRooms.text;

  ///HHSQ2
  HhsStatic.householdQuestions.hhsIsDwellingOther!.text =
      surveyPt.surveyPT.householdQuestions.hhsIsDwelling ?? '';
  HhsStatic.householdQuestions.hhsIsDwelling =
      surveyPt.surveyPT.householdQuestions.hhsIsDwelling; //solve
//HhsStatic.householdQuestions.hhsNumberApartments=surveyPt.surveyPT!.householdQuestions.hhsNumberApartments.text;
  HhsStatic.householdQuestions.hhsNumberSeparateFamilies =
      surveyPt.surveyPT.householdQuestions.hhsNumberSeparateFamilies;

  HhsStatic.householdQuestions.hhsNumberYearsInAddress =
      surveyPt.surveyPT.householdQuestions.hhsNumberYearsInAddress; //solve
  HhsStatic.householdAddress.hhsPhone =
      surveyPt.surveyPT.header.householdAddress.hhsPhone;
  VehModel.nearestPublicTransporter =
      surveyPt.surveyPT.vehiclesData.nearestBusStop ?? '';
  debugPrint('nearestPublicTransporter');
  debugPrint(surveyPt.surveyPT.vehiclesData.nearestBusStop);
  debugPrint("hhsNumberSeparateFamilies");

  debugPrint(surveyPt.surveyPT.householdQuestions.hhsNumberSeparateFamilies);
  for (int i = 1;
      i < QuestionsData.qh4[QuestionsData.qh4.keys.first]!.toList().length;
      i++) {
    if (int.parse(surveyPt.surveyPT.householdQuestions.hhsNumberSeparateFamilies
            .toString()) ==
        i) {
      QuestionsData.qh4[QuestionsData.qh4.keys.first][i - 1]["isChick"] = true;
    }
  }
  HhsStatic.houseHold = [];
  editingController.q6peopleUnder18 = [];
  editingController.q6peopleAdults18 = [];
  editingController.q6totalNumberOfVec = [];
  for (int i = 0; i < surveyPt.surveyPT.hhsSeparateFamilies!.length; i++) {
    editingController.q6peopleUnder18.add(TextEditingController(
        text: surveyPt.surveyPT.hhsSeparateFamilies![i].numberChildren
            .toString()));
    editingController.q6peopleAdults18.add(TextEditingController(
        text:
            surveyPt.surveyPT.hhsSeparateFamilies![i].numberAdults.toString()));
    editingController.q6totalNumberOfVec.add(TextEditingController(
        text: surveyPt.surveyPT.hhsSeparateFamilies![i].totalNumberVehicles
            .toString()));
  }
  editingController.peopleAdults18.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberAdults.toString();
  editingController.peopleUnder18.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberChildren.toString();
  debugPrint("object");
  debugPrint(surveyPt.surveyPT.householdQuestions.hhsNumberSeparateFamilies);


  ///hhsNumberYearsInAddress
  for (int i = 0;
      i < QuestionsData.qh7[QuestionsData.qh7.keys.first]!.toList().length;
      i++) {
    if (surveyPt.surveyPT.householdQuestions.hhsNumberYearsInAddress
            .toString() ==
        QuestionsData.qh7[QuestionsData.qh7.keys.first][i]["value"]) {
      QuestionsData.qh7[QuestionsData.qh7.keys.first][i]["isChick"] = true;
    }
  }

  ///Q7_1 hhsPedalCycles
  editingController.editingController3Q81 = EditingController3(
      peopleUnder18: TextEditingController(
          text: surveyPt
              .surveyPT.householdQuestions.hhsPedalCycles.childrenBikesNumber),
      totalNumber: TextEditingController(
          text: surveyPt
              .surveyPT.householdQuestions.hhsPedalCycles.totalBikesNumber),
      peopleAdults18: TextEditingController(
          text: surveyPt
              .surveyPT.householdQuestions.hhsPedalCycles.adultsBikesNumber));

  ///Q7_2 hhsPedalCycles
  editingController.editingController3Q83 = EditingController3(
      peopleUnder18: TextEditingController(
          text: surveyPt.surveyPT.householdQuestions.hhsElectricScooter
              .childrenBikesNumber),
      totalNumber: TextEditingController(
          text: surveyPt
              .surveyPT.householdQuestions.hhsElectricScooter.totalBikesNumber),
      peopleAdults18: TextEditingController(
          text: surveyPt.surveyPT.householdQuestions.hhsElectricScooter
              .adultsBikesNumber));

  ///Q7_3 hhsPedalCycles
  editingController.editingController3Q82 = EditingController3(
      peopleUnder18: TextEditingController(
          text: surveyPt.surveyPT.householdQuestions.hhsElectricCycles
              .childrenBikesNumber),
      totalNumber: TextEditingController(
          text: surveyPt
              .surveyPT.householdQuestions.hhsElectricCycles.totalBikesNumber),
      peopleAdults18: TextEditingController(
          text: surveyPt.surveyPT.householdQuestions.hhsElectricCycles
              .adultsBikesNumber));

  for (int i = 0;
      i <
          VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first]!
              .toList()
              .length;
      i++) {
    if (surveyPt.surveyPT.vehiclesData.nearestBusStop ==
        VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]["value"]) {
      VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]["isChick"] =
          true;
    }
  }

  ///Q8 hhsTotalIncome
  HhsStatic.householdQuestions.hhsTotalIncome =
      surveyPt.surveyPT.householdQuestions.hhsTotalIncome;

  ///Q10
  VehModel.vehiclesModel.numberParcelsDeliveries.text =
      surveyPt.surveyPT.vehiclesData.numberParcelsDeliveries.text;
  VehModel.vehiclesModel.numberParcels.text =
      surveyPt.surveyPT.vehiclesData.numberParcels.text;
  VehModel.vehiclesModel.numberOtherParcels.text =
      surveyPt.surveyPT.vehiclesData.numberOtherParcels.text;
  VehModel.vehiclesModel.numberGrocery.text =
      surveyPt.surveyPT.vehiclesData.numberGrocery.text;
  VehModel.vehiclesModel.numberFood.text =
      surveyPt.surveyPT.vehiclesData.numberFood.text;

  ///HHS_QH11

  HhsStatic.householdQuestions.hhsNumberShoppingTrip.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberShoppingTrip.text;

  HhsStatic.householdQuestions.hhsNumberHealthTrip.text =
      surveyPt.surveyPT.householdQuestions.hhsNumberHealthTrip.text;

  ///
  validationService.cc();
}
