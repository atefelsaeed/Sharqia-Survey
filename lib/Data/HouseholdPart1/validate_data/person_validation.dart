import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Helper/validator.dart';

import '../PersonData/person_model_list.dart';

class CheckPersonValidation {
  static validatePerson(context) async {
    var length = PersonModelList.personModelList.length;
    debugPrint("personModelList:: ${length.toString()}");
    for (int e = 0; e <= length; e++) {
      if (e < length) {
        var base = PersonModelList.personModelList[e];
        // if (PersonModelList.personModelList[e].occupationModel!.isEmployee !=
        //     "0") {}
        if (base.personalHeadData!.gender == '' ||
            base.personalHeadData!.gender == null) {
          debugPrint("Valid gender $e");
          return Validator.showSnack(context, " يجب إخيار !نوع الجنس ");
        } else if (base.personalHeadData!.relationshipHeadHHS!.isEmpty ||
            base.personalHeadData!.relationshipHeadHHS == null) {
          debugPrint("Valid relationshipHeadHHS $e");
          return Validator.showSnack(
              context, " يجب إخيار ! القرابة برب الاسرة؟ ");
        } else if (base.personalHeadData!.age.text == '') {
          debugPrint("Valid age $e");
          return Validator.showSnack(context, " يجب إخيار ! الفئة العمرية؟ ");
        } else if (PersonModelList
                    .personModelList[e].occupationModel!.isEmployee !=
                "0" &&
            (base.personalHeadData!.hhsHavePastTrip.text.isEmpty ||
                base.personalHeadData!.hhsHavePastTrip.text == "")) {
          debugPrint("Valid hhsHavePastTrip $e");
          return Validator.showSnack(
              context, " يجب إخيار! هل قمت برحلة فى الأيام السابقة ");
        } else if (base.personalHeadData!.nationalityType == '') {
          debugPrint("Valid nationalityType $e");
          return Validator.showSnack(context, " يجب إخيار !  الجنسية ");
        } else if (base.personalQuestion!.mainOccupationType!.isEmpty ||
            base.personalQuestion!.mainOccupationType == null) {
          debugPrint("Valid mainOccupationType $e");
          return Validator.showSnack(context, " يجب إخيار! الوظيفة الأساسية");
        } else if (base
                .personalQuestion!.haveDisabilityTransportMobility!.isEmpty ||
            base.personalQuestion!.haveDisabilityTransportMobility == null) {
          debugPrint("Valid haveDisabilityTransportMobility $e");
          return Validator.showSnack(context,
              " يجب إخيار! هل لديك أي إعاقة / احتياجات خاصة لحركة النقل؟");
        }
      } else {
        // SurveyPTProvider surveyPt =
        // Provider.of<SurveyPTProvider>(context, listen: false);
        // SurveysProvider surveys =
        // Provider.of<SurveysProvider>(context, listen: false);
        //
        //
        // final prefs = await SharedPreferences.getInstance();
        // bool? isFilled = prefs.getBool(AppConstants.isFilled);
        //
        // if (isFilled != null && isFilled == true) {
        //   surveys.addNotFilledSurvey(surveyPt.data);
        //   debugPrint('addNotFilledSurvey Person');
        // }
        debugPrint('navigate');

        return true;
      }
    }
  }
}
