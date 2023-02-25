import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Helper/validator.dart';

import '../../../UI/Screens/trips/trip_screen.dart';
import '../PersonData/person_model_list.dart';

class CheckPersonValidation {
  static validatePerson(context) {
    var length = PersonModelList.personModelList.length;

    for (int e = 0; e <= length; e++) {
      if (e < length) {
        var base = PersonModelList.personModelList[e];

        if (base.personalHeadData!.gender == '' ||
            base.personalHeadData!.gender == null) {
          return Validator.showSnack(context, " يجب إخيار !نوع الجنس ");
        } else if (base.personalHeadData!.relationshipHeadHHS!.isEmpty ||
            base.personalHeadData!.relationshipHeadHHS == null) {
          return Validator.showSnack(
              context, " يجب إخيار ! القرابة برب الاسرة؟ ");
        } else if (base.personalHeadData!.age.text == '') {
          return Validator.showSnack(context, " يجب إخيار ! الفئة العمرية؟ ");
        } else if (base.personalHeadData!.hhsHavePastTrip.text.isEmpty ||
            base.personalHeadData!.hhsHavePastTrip.text == "") {
          return Validator.showSnack(
              context, " يجب إخيار! هل قمت برحلة فى الأيام السابقة ");
        } else if (base.personalHeadData!.nationalityType == '') {
          return Validator.showSnack(context, " يجب إخيار !  الجنسية ");
        } else if (base.personalQuestion!.mainOccupationType!.isEmpty ||
            base.personalQuestion!.mainOccupationType == null) {
          return Validator.showSnack(context, " يجب إخيار! الوظيفة الأساسية");
        } else if (base
                .personalQuestion!.haveDisabilityTransportMobility!.isEmpty ||
            base.personalQuestion!.haveDisabilityTransportMobility == null) {
          return Validator.showSnack(context,
              " يجب إخيار! هل لديك أي إعاقة / احتياجات خاصة لحركة النقل؟");
        }
      } else {
        print('navigate');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TripScreen(),
          ),
        );
      }
    }
  }
}
