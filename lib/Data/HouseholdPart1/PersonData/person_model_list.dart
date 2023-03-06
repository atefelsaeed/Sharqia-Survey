import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/personal_question.dart';

import '../../../Models/Person_SurveyModel/person_model.dart';

class PersonModelList {
  static List<PersonModel> personModelList = [
    PersonModel(
      nationality: {
        "QPurposeOfBeingThere": [
          {"value": 'سعودي', "isChick": false},
          {"value": 'وافد عربي', "isChick": false},
          {"value": 'وافد اجنبي', "isChick": false},
        ],
        "title": "nationality",
        "subTitle":
            " A separate family is defined as who share the kitchen expenses and meals",
        "index": 0,
      },
      personName: TextEditingController(),
      travelWithOther: {
        'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
            [
          {"value": 'نعم', "isChick": false},
          {"value": 'لا', "isChick": false},
        ],
        "index": 0
      },

      //==personalHeadData==
      personalHeadData: PersonalHeadData(
        age: TextEditingController(),
        relationshipHeadHHSController: TextEditingController(),
        nationality: TextEditingController(),
        hhsHavePastTrip: TextEditingController(),
        nationalityType: '',
        showText: false,
        gender: '',
        checkAge: false,
        hasPasTrip: false,
        refuseToTellAge: false,
        relationshipHeadHHS: '',
      ),
      //==personalQuestion==
      personalQuestion: PersonalQuestion(
        mainOccupationType: '',
        asPassenger: '',
        availablePersonalCar: '',
        drivingLicenceType: '',
        haveBusPass: '',
        haveDisabilityTransportMobility: '',
        haveCarSharing: false,
        educationAddress: EducationAddress(
          fullAddress: TextEditingController(),
          geocodes: TextEditingController(),
        ),
        drivingLicenceTypeController: TextEditingController(),
        haveDisabilityTransportMobilityController: TextEditingController(),
      ),
      //==occupationModel==
      occupationModel: OccupationModel(
        earliestTimeFinishingWork: TextEditingController(),
        occupationSectorController: TextEditingController(),
        earliestTimeStartingWork: TextEditingController(),
        endingWoke: TextEditingController(),
        startingWoke: TextEditingController(),
        address: TextEditingController(),
        geoCodes: TextEditingController(),
        mainOccupationAddress: TextEditingController(),
        bestWorkspaceLocation: '',
        bikeWorkDays: 0,
        commuteWorkDays: 0,
        flexibleWorkingHours: '',
        isEmployee: '',
        isWorkFromHome: false,
        numberWorkFromHome: 0,
        occupationLevelSector: '',
        occupationSector: '',
        bestWorkspaceLocationController: TextEditingController(),
      ),
    ),
  ];
}
