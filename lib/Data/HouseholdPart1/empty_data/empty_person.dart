import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../PersonData/person_model_list.dart';

class EmptyPerson {
  static emptyPerson() {
    if (PersonModelList.personModelList.isNotEmpty) {
      PersonModelList.personModelList.length = 1;
      HhsStatic.hasPasTrip = false;
      PersonModelList.personModelList[0].travelWithOther = {
        'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
            [
          {"value": 'نعم', "isChick": false},
          {"value": 'لا', "isChick": false},
        ],
        "index": 0
      };
      PersonModelList.personModelList[0].nationality = {
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
      for (var element in PersonModelList.personModelList) {
        element.personalHeadData!.checkAge = false;
        element.personalHeadData!.refuseToTellAge = false;
        element.personalHeadData!.age.text = '';
        element.personName.text = '';
        element.personalHeadData!.nationality.text = '';
        element.personalHeadData!.nationalityType = '';
        element.personalHeadData!.hhsHavePastTrip.text = '';
        element.personalHeadData!.showText = false;
        element.personalHeadData!.relationshipHeadHHS = '';
        element.personalHeadData!.gender = '';
        element.personalQuestion!.mainOccupationType = '';
        element.personalQuestion!.haveDisabilityTransportMobility = '';
        element.personalQuestion!.haveBusPass = '';
        element.personalQuestion!.drivingLicenceType = '';
        element.personalQuestion!.availablePersonalCar = '';
        element.personalQuestion!.haveCarSharing = false;
        element.occupationModel!.occupationSector = '';
        element.occupationModel!.isEmployee = '';
        element.occupationModel!.occupationLevelSector = '';
        element.occupationModel!.bestWorkspaceLocation = '';
        element.occupationModel!.flexibleWorkingHours = '';
        element.occupationModel!.mainOccupationAddress.text = '';
        element.occupationModel!.earliestTimeFinishingWork.text = '';
        element.travelWithOther[element.travelWithOther.keys.first]!
            .toList()[element.travelWithOther["index"]]["isChick"] = false;
        element.nationality[element.nationality.keys.first]!
            .toList()[element.nationality["index"]]["isChick"] = false;
      }
    }
  }
}
