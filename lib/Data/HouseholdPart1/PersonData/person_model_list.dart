import 'package:flutter/cupertino.dart';

import '../../../Models/Person_SurveyModel/occupation_model.dart';
import '../../../Models/Person_SurveyModel/person_model.dart';
import '../../../Models/Person_SurveyModel/personal_question.dart';

class PersonModelList {
  static List<PersonModel> personModelList = [
    PersonModel(
      personName: TextEditingController(),
      travelWithOther:  {
        'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
        [
          {"value": 'نعم', "isChick": false},
          {"value": 'لا', "isChick": false},
        ],
        "index": 0
      },
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
      //==personalHeadData==
      personalHeadData: PersonalHeadData(
        age: TextEditingController(),
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
      ),
      //==occupationModel==
      occupationModel: OccupationModel(
        earliestTimeFinishingWork: TextEditingController(),
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
      ),
    ),
  ];
}
