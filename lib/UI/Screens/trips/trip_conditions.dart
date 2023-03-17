import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:sharqia_household_survey/Providers/survey_hhs.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/save_finish.dart';
import 'package:sharqia_household_survey/UI/Widgets/show_dialog_error.dart';

class TripConditions {
  void showError(context, Widget widget) => showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return widget;
      });

  ///
  bool checkIsCarDriver(int i, context) {
    var bas = TripModeList.tripModeList[i].travelTypeModel;
    if (((TripModeList.tripModeList[i].travelWay!.mainMode == 'سائق سيارة') ||
        (TripModeList.tripModeList[i].travelWay!.accessMode ==
            'سائق سيارة')) &&
        (bas.travelType != 'سيارة')) {
      showError(
          context,
          ShowErrorDialog(
              title: ' بماذا ذهبت ؟ رحلة ${i + 1}',
              content:
              'في سؤال 6 "الوضع الرئيسي" او "وضع الوصول" اذا كان الاختيار سائق سيارة يجب أن يكون الجواب في سؤال 8 بماذا ذهبت ؟ الجواب "سيارة"'));
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneAdultsNumber1(int i, context) {
    var bas = TripModeList.tripModeList[i]; //travelWithOtherModel
    int adultsNumber = bas.travelWithOtherModel!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.adultsNumber.text);
    int adultsNumber2 = bas.travelAloneHouseHold!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.adultsNumber.text);

    if ((adultsNumber2 <= adultsNumber) && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content:
          "''  عدد البالغين اكبر من او يساوي عدد البالغين في سؤال ( أي من افراد الاسرة ذهب معك ؟ ) عدد المرافقين يجب أن يكون اكبر من أو يساوي المرافقين من الاسرة''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneChildrenNumber1(int i, context) {
    var bas = TripModeList.tripModeList[i]; //travelWithOtherModel
    int adultsNumber = bas.travelWithOtherModel!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.childrenNumber.text);
    int adultsNumber2 = bas.travelAloneHouseHold!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.childrenNumber.text);

    if ((adultsNumber2 <= adultsNumber) && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content:
          "''  عدد الأطفال اكبر من او يساوي عدد الأطفال في سؤال ( أي من افراد الاسرة ذهب معك ؟ ) عدد المرافقين يجب أن يكون اكبر من أو يساوي المرافقين من الاسرة''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///

  bool checkIsTravelAloneAdultsNumberQ4HHS(int i, context) {
    SurveyPTProvider surveyPt =
    Provider.of<SurveyPTProvider>(context, listen: false);

    var bas = TripModeList.tripModeList[i];
    debugPrint('ssss');
    debugPrint(bas.travelWithOtherModel!.childrenNumber.text);
    int adultsNumber2 = bas.travelWithOtherModel!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.childrenNumber.text);

    int numAdults = 0;
    int length = surveyPt.hhsSeparateFamilies.length;

    for (int i = 0; i < length; i++) {
      numAdults = int.parse(surveyPt.hhsSeparateFamilies[i].numberChildren!) +
          numAdults;
      debugPrint(">>$numAdults");
    }

    debugPrint('checkIsTravelAloneAdultsNumberQ4HHS');
    debugPrint("$adultsNumber2 >>$numAdults");
    if (adultsNumber2 > numAdults && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content: "''"
              "اذا كان الاختيار "
              "مع آخرين"
              " فأن سؤال ( أي من افراد الاسرة ذهب معك ؟ )"
              " يكون عدد الأطفال لا يزيد من عدد الأطفال في صفحة 1 سؤال 4 "
              "عدد الأطفال "
              ""
              "''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneChildrenNumberQ4HHS(int i, context) {
    SurveyPTProvider surveyPt =
    Provider.of<SurveyPTProvider>(context, listen: false);

    var bas = TripModeList.tripModeList[i];

    int adultsNumber2 = bas.travelWithOtherModel!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.adultsNumber.text);

    int numAdults = 0;
    int length = surveyPt.hhsSeparateFamilies.length;

    for (int i = 0; i < length; i++) {
      numAdults =
          int.parse(surveyPt.hhsSeparateFamilies[i].numberAdults!) + numAdults;
    }
    debugPrint('checkIsTravelAloneChildrenNumberQ4HHS');
    debugPrint("$adultsNumber2 >>$numAdults");
    if (adultsNumber2 > numAdults && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content: "''"
              "اذا كان الاختيار "
              "مع آخرين"
              " فأن سؤال ( أي من افراد الاسرة ذهب معك ؟ )"
              " يكون عدد البالغين لا يزيد من عدد الأطفال في صفحة 1 سؤال 4 "
              "عدد البالغين "
              ""
              "''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  List tripOwner = [];
  List<String> personsWithoutTrip = [];
  List tripPersons = [];

  ///
  bool personWithoutTrip({
    required BuildContext context,
    required Function function,
  }) {
    var length = TripModeList.tripModeList.length;
    tripOwner.clear();
    personsWithoutTrip.clear();
    for (int i = 0; i < length; i++) {
      var bas = TripModeList.tripModeList[i];
      tripPersons = bas.person;
      // if (tripOwner.isEmpty) {
      //   tripOwner.add(bas.chosenPerson);
      // } else if (bas.chosenPerson != tripOwner[i]) {
      //   tripOwner.add(bas.chosenPerson);
      // }
      tripOwner.add(bas.chosenPerson);
      debugPrint(tripPersons.toString());
      debugPrint(tripOwner.toSet().toString());

      // int tripLength = tripPersons.length;
      // for (int e = 0; e < tripLength; e++) {
      //   debugPrint('trinp person :::');
      //   if (i > 0) {
      //     debugPrint('tripPersons_list');
      //     if (tripPersons[e] != tripOwner[i]) {
      //       debugPrint('personsWithoutTrip');
      //       personsWithoutTrip.add(tripPersons[e]);
      //     }}
      // }
    }
    // if (personsWithoutTrip.isNotEmpty) {
    //   debugPrint('personsWithoutTrip.isNotEmpty$personsWithoutTrip');
    //   SaveAndFinish.saveAndFinish(context, personsWithoutTrip, function);
    //   return false;
    // } else {
    //   return true;
    // }
    List newList = tripOwner.toSet().toList();
    if (tripPersons.length != newList.length) {
      debugPrint('personsWithoutTrip.isNotEmpty$personsWithoutTrip');
      SaveAndFinish.showSaveAndFinishDialog(context, personsWithoutTrip, function());
      return false;
    } else {
      return true;
    }
  }
}
