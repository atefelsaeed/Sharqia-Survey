import 'package:flutter/material.dart';
import '../../../Helper/validator.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../UI/Screens/vechicles/vechicles_screen.dart';
import '../VechelisData/veh_model.dart';

class CheckHHSValidation {
  static validate(context) async {
    if (HhsStatic.householdQuestions.hhsDwellingType == null ||
        HhsStatic.householdQuestions.hhsDwellingType == "") {
      return Validator.showSnack(context, " يجب إخيار! 1.وصف المسكن؟ ");
    } else if (HhsStatic.householdQuestions.hhsIsDwelling == null ||
        HhsStatic.householdQuestions.hhsIsDwelling == "") {
      return Validator.showSnack(context, "يجب إخيار! 2.ملكية المسكن؟ ");
    } else if (HhsStatic.householdQuestions.hhsNumberSeparateFamilies == '' ||
        HhsStatic.householdQuestions.hhsNumberSeparateFamilies == null) {
      return Validator.showSnack(context,
          "يجب إخيار! 3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟  ");
    } else if (HhsStatic.householdQuestions.hhsNumberYearsInAddress == null ||
        HhsStatic.householdQuestions.hhsNumberYearsInAddress == '') {
      return Validator.showSnack(context,
          "يجب إخيار! 6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟");
    } else if (HhsStatic.householdQuestions.hhsTotalIncome == null ||
        HhsStatic.householdQuestions.hhsTotalIncome == "") {
      return Validator.showSnack(context,
          " يجب إخيار ! 8.متوسط دخل جميع أفراد الاسرة الشهري مع المزايا؟");
    } else if (VehModel.nearestPublicTransporter == '') {
      return Validator.showSnack(context,
          ".يجب إخيار ! 9.كم تبعد اقرب محطة حافلات نقل عام عن منزلك سيرا على الاقدام ؟");
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const VehiclesScreen()));
    }
  }
}
