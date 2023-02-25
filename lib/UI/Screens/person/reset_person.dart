import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';

import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';

class PersonProvider extends ChangeNotifier {
 /* getAllPeronUpdated(BuildContext context) async {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    final validationService =
        Provider.of<ActionSurveyProvider>(context, listen: false);
    await surveyPt.getAllLocalData();
    PersonModelList.personModelList = [];
    print(surveyPt.surveyAllData!.first.personData!.length);
    for (int i = 0; i < surveyPt.surveyAllData!.first.personData!.length; i++) {
      print(
          "surveyPt.surveyAllData!.first.personData![i].personalHeadData!.hasPasTrip");

      print(surveyPt
          .surveyAllData!.first.personData![i].personalHeadData!.hasPasTrip);
      //for (int ii = 1; ii < QuestionsData.hhsHavePastTrip[QuestionsData.hhsHavePastTrip.keys.first]!.toList().length; ii++) {
      if (surveyPt.surveyAllData!.first.personData![i].personalHeadData!
              .hasPasTrip ==
          false) {
        QuestionsData.hhsHavePastTrip[QuestionsData.hhsHavePastTrip.keys.first]
            [1]["isChick"] = true;
      } else {
        QuestionsData.hhsHavePastTrip[QuestionsData.hhsHavePastTrip.keys.first]
            [0]["isChick"] = true;
      }
      // }
      print(" surveyPt.surveyAllData!.first.personData![i].personalHeadData!.nationalityType");
      print( surveyPt.surveyAllData!.first.personData![i].personalHeadData!.nationalityType);

      for (int ii = 0;
      ii <      PersonData.nationality[PersonData.nationality.keys.first]!.toList().length;
      ii++) {
        print("PersonData.nationality[PersonData.nationality.keys.first]!.toList()[ii][""]");
        print(PersonData.nationality[PersonData.nationality.keys.first]!.toList()[ii]["value"]);

        if (PersonData.nationality[PersonData.nationality.keys.first]!.toList()[ii]["value"] ==
            surveyPt.surveyAllData!.first.personData![i].personalHeadData!.nationalityType) {
          PersonData.nationality[PersonData.nationality.keys.first][ii]["isChick"] = true;
        }
      }



        PersonModelList.personModelList.add(PersonModel(
        personName: TextEditingController(
            text: surveyPt.surveyAllData!.first.personData![i].personName.text),
        //==personalHeadData==

        personalHeadData: PersonalHeadData(

          age: TextEditingController(text: surveyPt.surveyAllData!.first.personData![i]
              .personalHeadData!.age.text),
          nationality: TextEditingController(
              text: surveyPt.surveyAllData!.first.personData![i]
                  .personalHeadData!.nationality.text),
          hhsHavePastTrip: TextEditingController(
              text: surveyPt.surveyAllData!.first.personData![i]
                  .personalHeadData!.hhsHavePastTrip.text),
          nationalityType: surveyPt.surveyAllData!.first.personData![i]
              .personalHeadData!.nationalityType,
          showText: false,
          gender: surveyPt
              .surveyAllData!.first.personData![i].personalHeadData!.gender,
          checkAge: true,
          //surveyPt.surveyAllData!.first.personData![i].personalHeadData!.checkAge,
          hasPasTrip: surveyPt
              .surveyAllData!.first.personData![i].personalHeadData!.hasPasTrip,
          refuseToTellAge: surveyPt.surveyAllData!.first.personData![i]
              .personalHeadData!.refuseToTellAge,
          relationshipHeadHHS: surveyPt.surveyAllData!.first.personData![i]
              .personalHeadData!.relationshipHeadHHS,
        ),
        //==personalQuestion==
        personalQuestion: PersonalQuestion(
          mainOccupationType:  surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.mainOccupationType,
          asPassenger:  surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.asPassenger,
          availablePersonalCar: surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.availablePersonalCar,
          drivingLicenceType: surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.drivingLicenceType,
          haveBusPass:surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.haveBusPass,
          haveDisabilityTransportMobility: surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.haveDisabilityTransportMobility,
          haveCarSharing: surveyPt
              .surveyAllData!.first.personData![i].personalQuestion!.haveCarSharing,
          educationAddress: EducationAddress(
            fullAddress: TextEditingController(),
            geocodes: TextEditingController(),
          ),
        ),
        //==occupationModel==
        occupationModel: OccupationModel(
          earliestTimeFinishingWork: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.earliestTimeFinishingWork.text),
          earliestTimeStartingWork: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.earliestTimeStartingWork.text),
          endingWoke: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.endingWoke.text),
          startingWoke: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.startingWoke.text),
          address: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.address.text),
          geoCodes: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.geoCodes.text),
          mainOccupationAddress: TextEditingController(text:surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.mainOccupationAddress.text),
          bestWorkspaceLocation: surveyPt
            .surveyAllData!.first.personData![i].occupationModel!.bestWorkspaceLocation,
          bikeWorkDays: surveyPt
            .surveyAllData!.first.personData![i].occupationModel!.bikeWorkDays,
          commuteWorkDays: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.commuteWorkDays,
          flexibleWorkingHours: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.flexibleWorkingHours,
          isEmployee: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.isEmployee,
          isWorkFromHome: false,
          numberWorkFromHome: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.numberWorkFromHome,
          occupationLevelSector: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.occupationLevelSector,
          occupationSector: surveyPt
              .surveyAllData!.first.personData![i].occupationModel!.occupationSector,
        ),
      ));
      isEmployee(surveyPt.surveyAllData!.first.personData![i]
          .personalHeadData!.age.text,i);
    }

    notifyListeners();
  }*/

  nationality(ChangeBoxResponse r,int i){

    if (r.val == "لا" &&
        r.check == true) {
      PersonModelList.personModelList[i].personalHeadData!
          .hasPasTrip =
      true;
      PersonModelList.personModelList[i]
          .personalHeadData!
          .hhsHavePastTrip
          .text = '';
    } else {
      PersonModelList.personModelList[i].personalHeadData!
          .hasPasTrip =
      false;

      PersonModelList.personModelList[i]
          .personalHeadData!
          .hhsHavePastTrip
          .text = 'نعم';
    }
    notifyListeners();
  }

  isEmployee(String d, int i) {
    if (d.isNotEmpty) {
      if (int.parse(d.toString()) > 18) {
        PersonModelList.personModelList[i].occupationModel!.isEmployee = "1";
      } else {
        PersonModelList.personModelList[i].occupationModel!.isEmployee = "0";
      }
    } else {
      PersonModelList.personModelList[i].occupationModel!.isEmployee = "";
    }
    notifyListeners();
  }

  groupAgeKey(int i, String p) {
    PersonModelList.personModelList[i].personalHeadData!.checkAge = false;

    PersonModelList.personModelList[i].personalHeadData!.age.text =
        p.toString();

    List value = PersonData.groupAge[PersonData.groupAge.keys.first].toList();

    for (int inr = 0; inr < value.length; inr++) {
      if (p == value[inr]["value"]) {
        PersonModelList.personModelList[i].occupationModel!.isEmployee =
            value[inr]["type"];
      }
      notifyListeners();
    }
    notifyListeners();
  }

  /*checkAge(int i, value) {
    print(value);
    PersonModelList.personModelList[i].personalHeadData!.refuseToTellAge =
        value!;
    PersonModelList.personModelList[i].personalHeadData!.checkAge = false;


    notifyListeners();
  }*/
  checkAge(int i,value){
    PersonModelList.personModelList[i]
        .personalHeadData!
        .checkAge = value!;
    PersonModelList.personModelList[i]
        .personalHeadData!
        .age
        .text = '';
    PersonModelList.personModelList[i]
        .personalHeadData!
        .refuseToTellAge = false;
    notifyListeners();
  }

  checkNo(int i, value) {
    PersonModelList.personModelList[i].personalHeadData!.refuseToTellAge =
        value!;
    PersonModelList.personModelList[i].personalHeadData!.checkAge = false;
    notifyListeners();
  }
}
