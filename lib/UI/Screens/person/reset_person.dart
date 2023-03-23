import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharqia_household_survey/Helper/validator.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/person_model.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:sharqia_household_survey/UI/Screens/person/person_conditions.dart';

import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/app_constants.dart';
import '../../../Models/Person_SurveyModel/personal_question.dart';
import '../../../Providers/user_surveys.dart';

class PersonProvider extends ChangeNotifier {
  getPersonUpdatedData(context) async {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    bool? isFilled = prefs.getBool(AppConstants.isFilled);

    if (isFilled != null && isFilled == true) {
      debugPrint('Not Filled Survey');
      getAllPeronUpdated(context);
    } else if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetPerson == true)) {
      debugPrint('Edit Survey');
      getAllPeronUpdated(context);
      AppConstants.isResetPerson = false;
    } else {
      debugPrint('New Survey');
    }
    notifyListeners();
  }

  getAllPeronUpdated(BuildContext context) async {
    UserSurveysProvider surveyPt =
        Provider.of<UserSurveysProvider>(context, listen: false);

    PersonModelList.personModelList = [];

    int personListLength = surveyPt.surveyPT.personData?.length ?? 0;

    if (personListLength > 0) {
      for (int i = 0; i < personListLength; i++) {
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
        List value2 = nationality[nationality.keys.first].toList();

        for (int inr = 0; inr < value2.length; inr++) {
          if (surveyPt
                  .surveyPT.personData?[i].personalHeadData?.nationalityType ==
              value2[inr]["value"]) {
            nationality[nationality.keys.first].toList()[inr]["isChick"] = true;
            if (surveyPt.surveyPT.personData?[i].personalHeadData
                    ?.nationalityType !=
                "سعودي") {
              surveyPt.surveyPT.personData?[i].personalHeadData?.showText =
                  true;
            }
          } else {
            nationality[nationality.keys.first].toList()[inr]["isChick"] =
                false;
          }
        }

        Map<String, dynamic> travelWithOther = {
          'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
              [
            {"value": 'نعم', "isChick": false},
            {"value": 'لا', "isChick": false},
          ],
          "index": 0
        };

        if (surveyPt.surveyPT.personData?[i].personalHeadData?.hhsHavePastTrip
                .text ==
            "نعم") {
          debugPrint(surveyPt
              .surveyPT.personData?[i].personalHeadData?.hhsHavePastTrip.text);
          travelWithOther = {
            'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                [
              {"value": 'نعم', "isChick": true},
              {"value": 'لا', "isChick": false},
            ],
            "index": 0
          };
          surveyPt.surveyPT.personData?[i].personalHeadData?.hasPasTrip = false;
        } else {
          travelWithOther = {
            'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                [
              {"value": 'نعم', "isChick": false},
              {"value": 'لا', "isChick": true},
            ],
            "index": 0
          };

          surveyPt.surveyPT.personData?[i].personalHeadData?.hasPasTrip = true;

          //PersonModelList.personModelList[i].personalHeadData!.hhsHavePastTrip=surveyPt.surveyPT.personData![i].personalHeadData!.hhsHavePastTrip;

        }

        PersonModelList.personModelList.add(PersonModel(
          personName: TextEditingController(
              text: surveyPt.surveyPT.personData![i].personName.text),
          //==personalHeadData==

          personalHeadData: PersonalHeadData(
            age: surveyPt.surveyPT.personData![i].personalHeadData!
                        .refuseToTellAge ==
                    false
                ? TextEditingController(
                    text: surveyPt
                        .surveyPT.personData![i].personalHeadData!.age.text)
                : TextEditingController(),
            nationality: TextEditingController(
                text: surveyPt.surveyPT.personData![i].personalHeadData!
                    .nationality.text),

            relationshipHeadHHSController: TextEditingController(
                text: surveyPt.surveyPT.personData![i].personalHeadData!
                    .relationshipHeadHHS),
            hhsHavePastTrip: TextEditingController(
                text: surveyPt.surveyPT.personData![i].personalHeadData!
                    .hhsHavePastTrip.text),
            nationalityType: surveyPt
                .surveyPT.personData![i].personalHeadData!.nationalityType,
            showText:
                surveyPt.surveyPT.personData![i].personalHeadData!.showText,
            gender: surveyPt.surveyPT.personData![i].personalHeadData!.gender,
            checkAge: true,
            //surveyPt.surveyAllData!.first.personData![i].personalHeadData!.checkAge,
            hasPasTrip:
                surveyPt.surveyPT.personData![i].personalHeadData!.hasPasTrip,
            refuseToTellAge: surveyPt
                .surveyPT.personData![i].personalHeadData!.refuseToTellAge,
            relationshipHeadHHS: surveyPt
                .surveyPT.personData![i].personalHeadData!.relationshipHeadHHS,
          ),
          //==personalQuestion==
          personalQuestion: PersonalQuestion(
            mainOccupationType: surveyPt
                .surveyPT.personData![i].personalQuestion!.mainOccupationType,
            asPassenger:
                surveyPt.surveyPT.personData![i].personalQuestion!.asPassenger,
            availablePersonalCar: surveyPt
                .surveyPT.personData![i].personalQuestion!.availablePersonalCar,
            drivingLicenceType: surveyPt
                .surveyPT.personData![i].personalQuestion!.drivingLicenceType,
            haveBusPass:
                surveyPt.surveyPT.personData![i].personalQuestion!.haveBusPass,
            haveDisabilityTransportMobility: surveyPt.surveyPT.personData![i]
                .personalQuestion!.haveDisabilityTransportMobility,
            haveCarSharing: surveyPt
                .surveyPT.personData![i].personalQuestion!.haveCarSharing,
            educationAddress: EducationAddress(
              fullAddress: TextEditingController(),
              geocodes: TextEditingController(),
            ),
            drivingLicenceTypeController: TextEditingController(
                text: surveyPt.surveyPT.personData![i].personalQuestion!
                    .drivingLicenceType),
            haveDisabilityTransportMobilityController: TextEditingController(
                text: surveyPt.surveyPT.personData![i].personalQuestion!
                    .haveDisabilityTransportMobility),
          ),
          //==occupationModel==================
          occupationModel: OccupationModel(
            earliestTimeFinishingWork: TextEditingController(
                text: surveyPt.surveyPT.personData![i].occupationModel!
                    .earliestTimeFinishingWork.text),
            occupationSectorController: TextEditingController(
                text: surveyPt
                    .surveyPT.personData![i].occupationModel!.occupationSector),
            earliestTimeStartingWork: TextEditingController(
                text: surveyPt.surveyPT.personData![i].occupationModel!
                    .earliestTimeStartingWork.text),
            endingWoke: TextEditingController(
                text: surveyPt
                    .surveyPT.personData![i].occupationModel!.endingWoke.text),
            startingWoke: TextEditingController(
                text: surveyPt.surveyPT.personData![i].occupationModel!
                    .startingWoke.text),
            address: TextEditingController(
                text: surveyPt
                    .surveyPT.personData![i].occupationModel!.address.text),
            geoCodes: TextEditingController(
                text: surveyPt
                    .surveyPT.personData![i].occupationModel!.geoCodes.text),
            mainOccupationAddress: TextEditingController(
                text: surveyPt.surveyPT.personData![i].occupationModel!
                    .mainOccupationAddress.text),
            bestWorkspaceLocation: surveyPt
                .surveyPT.personData![i].occupationModel!.bestWorkspaceLocation,
            bikeWorkDays:
                surveyPt.surveyPT.personData![i].occupationModel!.bikeWorkDays,
            commuteWorkDays: surveyPt
                .surveyPT.personData![i].occupationModel!.commuteWorkDays,
            flexibleWorkingHours: surveyPt
                .surveyPT.personData![i].occupationModel!.flexibleWorkingHours,
            isEmployee:
                surveyPt.surveyPT.personData![i].occupationModel!.isEmployee,
            isWorkFromHome: false,
            numberWorkFromHome: surveyPt
                .surveyPT.personData![i].occupationModel!.numberWorkFromHome,
            occupationLevelSector: surveyPt
                .surveyPT.personData![i].occupationModel!.occupationLevelSector,
            occupationSector: surveyPt
                .surveyPT.personData![i].occupationModel!.occupationSector,
            bestWorkspaceLocationController: TextEditingController(
                text: surveyPt.surveyPT.personData![i].occupationModel!
                    .bestWorkspaceLocation),
          ),
          nationality: nationality,
          travelWithOther: travelWithOther,
        ));

        if (surveyPt
                .surveyPT.personData![i].personalHeadData?.refuseToTellAge ==
            true) {
          groupAgeKey2(
              i, surveyPt.surveyPT.personData![i].personalHeadData!.age.text);
          debugPrint("2222222");
        } else {
          isEmployeeEdit(
              surveyPt.surveyPT.personData![i].personalHeadData!.age.text, i);
        }
      }
    }

    //notifyListeners();
  }

  nationality(ChangeBoxResponse r, int i) {
    if (r.val == "لا" && r.check == true) {
      PersonModelList.personModelList[i].personalHeadData?.hasPasTrip = true;
      PersonModelList
          .personModelList[i].personalHeadData?.hhsHavePastTrip.text = '';
    } else {
      PersonModelList.personModelList[i].personalHeadData?.hasPasTrip = false;

      PersonModelList
          .personModelList[i].personalHeadData?.hhsHavePastTrip.text = 'نعم';
    }
    notifyListeners();
  }

  isEmployeeEdit(String d, int i) {
    if (d.isNotEmpty) {
      if (int.parse(d.toString()) > 18) {
        PersonModelList.personModelList[i].occupationModel?.isEmployee = "1";
      } else {
        PersonModelList.personModelList[i].occupationModel?.isEmployee = "0";
      }
    } else {
      PersonModelList.personModelList[i].occupationModel?.isEmployee = "";
    }
    //  notifyListeners();
  }

  isEmployee(String d, int i) {
    if (d.isNotEmpty) {
      if (Validator.validateNumber(d) > 18) {
        PersonModelList.personModelList[i].occupationModel?.isEmployee = "1";
      } else if (Validator.validateNumber(d) > 0 &&
          Validator.validateNumber(d) < 5) {
        PersonModelList.personModelList[i].occupationModel?.isEmployee = "0";
      } else {
        PersonModelList.personModelList[i].occupationModel?.isEmployee = "2";
      }
    } else {
      PersonModelList.personModelList[i].occupationModel?.isEmployee = "";
    }
    notifyListeners();
  }

  groupAgeKey2(int i, String p) {
    PersonModelList.personModelList[i].personalHeadData?.checkAge = false;

    PersonModelList.personModelList[i].personalHeadData?.age.text =
        p.toString();

    List value = PersonData.groupAge[PersonData.groupAge.keys.first].toList();

    for (int inr = 0; inr < value.length; inr++) {
      if (p == value[inr]["value"]) {
        PersonModelList.personModelList[i].occupationModel?.isEmployee =
            value[inr]["type"];
      }
      // notifyListeners();
    }
    //notifyListeners();
  }

  groupAgeKey(int i, String p) {
    PersonModelList.personModelList[i].personalHeadData?.checkAge = false;

    PersonModelList.personModelList[i].personalHeadData?.age.text =
        p.toString();

    List value = PersonData.groupAge[PersonData.groupAge.keys.first].toList();

    for (int inr = 0; inr < value.length; inr++) {
      if (p == value[inr]["value"]) {
        PersonModelList.personModelList[i].occupationModel?.isEmployee =
            value[inr]["type"];
      }
      notifyListeners();
    }
    notifyListeners();
  }

  travelWithOther(int i, ChangeBoxResponse r) {
    if (r.val == "لا" && r.check == true) {
      PersonModelList.personModelList[i].personalHeadData?.hasPasTrip = true;
      PersonModelList
          .personModelList[i].personalHeadData?.hhsHavePastTrip.text = '';
    } else {
      PersonModelList.personModelList[i].personalHeadData?.hasPasTrip = false;

      PersonModelList
          .personModelList[i].personalHeadData?.hhsHavePastTrip.text = 'نعم';
    }
    notifyListeners();
  }

  checkAge(int i, value) {
    PersonModelList.personModelList[i].personalHeadData?.checkAge = value!;
    PersonModelList.personModelList[i].personalHeadData?.age.text = '';
    PersonModelList.personModelList[i].personalHeadData?.refuseToTellAge =
        false;
    notifyListeners();
  }

  checkNo(int i, value) {
    PersonModelList.personModelList[i].personalHeadData?.refuseToTellAge =
        value!;
    PersonModelList.personModelList[i].personalHeadData?.checkAge = false;
    notifyListeners();
  }

  ///occupationSector
  occupationSector(int i, p) {
    var base = PersonModelList.personModelList[i].occupationModel!;
    base.occupationSector = p.toString();

    if (base.occupationSector != " حدد أخرى") {
      base.occupationSector = p.toString();
      base.occupationSectorController.text = base.occupationSector!;
    } else {
      base.occupationSectorController.text = " حدد أخرى";
      base.occupationSector != base.occupationSectorController.text;
    }

    PersonConditions().checkOccupationSectorOther(i);
    notifyListeners();
  }

  ///bestWorkspaceLocation
  bestWorkspaceLocation(int i, String p) {
    var base = PersonModelList.personModelList[i].occupationModel!;
    base.bestWorkspaceLocation = p.toString();

    if (base.bestWorkspaceLocation != "'أخرى'") {
      base.bestWorkspaceLocation = p.toString();
      base.bestWorkspaceLocationController.text = base.bestWorkspaceLocation!;
    } else {
      base.bestWorkspaceLocationController.text = "'أخرى'";
      base.bestWorkspaceLocation != base.bestWorkspaceLocationController.text;
    }

    PersonConditions().checkBestWorkspaceLocationOther(i);
    notifyListeners();
  }

  ///drivingLicenceType
  drivingLicenceType(int i, p) {
    var base = PersonModelList.personModelList[i].personalQuestion!;
    base.drivingLicenceType = p.toString();

    if (base.drivingLicenceType != "آخر") {
      base.drivingLicenceType = p.toString();
      base.drivingLicenceTypeController.text = base.drivingLicenceType!;
    } else {
      base.drivingLicenceTypeController.text = "آخر";
      base.drivingLicenceType != base.drivingLicenceTypeController.text;
    }

    PersonConditions().checkDrivingLicenceTypeOther(i);
    notifyListeners();
  }

  ///haveDisabilityTransportMobility
  haveDisabilityTransportMobility(int i, p) {
    var base = PersonModelList.personModelList[i].personalQuestion!;
    base.haveDisabilityTransportMobility = p.toString();

    if (base.haveDisabilityTransportMobility != "أخرى .. حدد") {
      base.haveDisabilityTransportMobility = p.toString();
      base.haveDisabilityTransportMobilityController.text =
          base.haveDisabilityTransportMobility!;
    } else {
      base.haveDisabilityTransportMobilityController.text = "أخرى .. حدد";
      base.haveDisabilityTransportMobility !=
          base.haveDisabilityTransportMobilityController.text;
    }

    PersonConditions().checkDrivingLicenceTypeOther(i);
    notifyListeners();
  }

  ///haveDisabilityTransportMobility
  relationshipHeadHHS(int i, p) {
    var base = PersonModelList.personModelList[i].personalHeadData!;
    base.relationshipHeadHHS = p.toString();

    if (base.relationshipHeadHHS != "'أخرى'") {
      base.relationshipHeadHHS = p.toString();
      base.relationshipHeadHHSController.text = base.relationshipHeadHHS!;
    } else {
      base.relationshipHeadHHSController.text = "'أخرى'";
      base.relationshipHeadHHS != base.relationshipHeadHHSController.text;
    }

    notifyListeners();
  }
}
