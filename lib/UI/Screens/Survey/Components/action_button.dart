import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';
import 'package:sharqia_household_survey/UI/Screens/person/components/default_entry.dart';
import 'package:sharqia_household_survey/UI/Widgets/show_dialog_error.dart';

import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Data/HouseholdPart1/validate_data/hhs_validation.dart';
import '../../../../Helper/validator.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Providers/auth.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../Widgets/custom_buttton.dart';
import '../actions/action_survey_screen.dart';
import '../survey_conditions.dart';

class ActionButton extends StatelessWidget {
  EditingController editingController;
  final GlobalKey<FormState> keyVal;

  final String id;

  ActionButton({
    super.key,
    required this.editingController,
    required this.keyVal,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    final validationService = Provider.of<ActionSurveyProvider>(context);
    Auth auth = Provider.of<Auth>(context, listen: false);

    return DefaultButton(
      function: () async {
        if (keyVal.currentState!.validate()) {
          keyVal.currentState!.save();
          debugPrint('Save HHS');
          HhsStatic.houseHold.clear();
          for (int i = 0; i < editingController.q6peopleUnder18.length; i++) {
            HhsStatic.houseHold.add(
              SeparateFamilies(
                editingController.q6peopleAdults18[i].text,
                editingController.q6peopleUnder18[i].text,
                editingController.q6totalNumberOfVec[i].text,
              ),
            );
          }

          surveyPt.id = id;

          //==========HHS-Header============
          Random random = Random();
          int randomNumber = (1000 + random.nextInt(10000 - 1000));
          int num = int.parse('${auth.uid}001$randomNumber');
          surveyPt.headerLat = 0;
          surveyPt.interViewDate = DateTime.now();
          surveyPt.headerLong = 0;
          surveyPt.headerEmpNumber = auth.uid;
          surveyPt.headerInterviewNumber = num;
          surveyPt.hhsPhone = HhsStatic.householdAddress.hhsPhone;
          // ===>> Q1=====
          surveyPt.hhsDwellingType =
              HhsStatic.householdQuestions.hhsDwellingType; //solve
          surveyPt.hhsNumberApartments.text =
              HhsStatic.householdQuestions.hhsNumberApartments.text;
          surveyPt.hhsNumberFloors.text =
              HhsStatic.householdQuestions.hhsNumberFloors.text;
          surveyPt.hhsNumberBedRooms.text =
              HhsStatic.householdQuestions.hhsNumberBedRooms.text;
          // ================ HHSQ10 ==============
          // surveyPt.hhsSeparateFamilies = HhsStatic.houseHold[0].totalNumberVehicles;
          surveyPt.vehiclesData.numberParcels =
              VehModel.vehiclesModel.numberParcels;
          surveyPt.vehiclesData.numberParcelsDeliveries =
              VehModel.vehiclesModel.numberParcelsDeliveries;
          surveyPt.vehiclesData.numberFood = VehModel.vehiclesModel.numberFood;
          surveyPt.vehiclesData.numberGrocery =
              VehModel.vehiclesModel.numberGrocery;
          surveyPt.vehiclesData.numberOtherParcels =
              VehModel.vehiclesModel.numberOtherParcels;

          surveyPt.hhsIsDwellingType =
              HhsStatic.householdQuestions.hhsIsDwelling; //solve

          surveyPt.hhsNumberSeparateFamilies =
              HhsStatic.householdQuestions.hhsNumberSeparateFamilies; //solve
          surveyPt.hhsNumberYearsInAddress =
              HhsStatic.householdQuestions.hhsNumberYearsInAddress; //solve

          surveyPt.hhsNumberAdults = editingController.peopleAdults18.text;
          surveyPt.hhsNumberChildren =
              editingController.peopleUnder18.text; //solve
          surveyPt.hhsSeparateFamilies = HhsStatic.houseHold;
          surveyPt.hhsTotalIncome = HhsStatic.householdQuestions.hhsTotalIncome;

          ///
          surveyPt.hhsPCChildrenBikesNumber =
              editingController.editingController3Q81.peopleUnder18.text;
          surveyPt.hhsPCTotalBikesNumber =
              editingController.editingController3Q81.totalNumber.text;
          surveyPt.hhsPCAdultsBikesNumber =
              editingController.editingController3Q81.peopleAdults18.text;

          ///
          HhsStatic.peopleUnder18 = editingController.peopleUnder18.text;
          HhsStatic.peopleAdults18 = editingController.peopleAdults18.text;

          ///
          surveyPt.hhsECChildrenBikesNumber =
              editingController.editingController3Q82.peopleUnder18.text;
          surveyPt.hhsECTotalBikesNumber =
              editingController.editingController3Q82.totalNumber.text;
          surveyPt.hhsECAdultsBikesNumber =
              editingController.editingController3Q82.peopleAdults18.text;

          ///
          surveyPt.hhsESChildrenBikesNumber =
              editingController.editingController3Q83.peopleUnder18.text;
          surveyPt.hhsESTotalBikesNumber =
              editingController.editingController3Q83.totalNumber.text;
          surveyPt.hhsESAdultsBikesNumber =
              editingController.editingController3Q83.peopleAdults18.text;

          ///HHS_QH11
          surveyPt.hhsNumberShoppingTrip.text =
              HhsStatic.householdQuestions.hhsNumberShoppingTrip.text;
          surveyPt.hhsNumberHealthTrip.text =
              HhsStatic.householdQuestions.hhsNumberHealthTrip.text;

          ///
          // surveyPt.hhsDemolishedAreas = editingController.yes.text;
          surveyPt.headerDistrictName = '';
          surveyPt.headerZoneNumber = '';

          RegExp regex = RegExp(
              r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
          if (!regex
              .hasMatch(HhsStatic.householdAddress.hhsPhone.text.trim())) {
            return Validator.showSnack(context, 'رقم الهاتف غير صحيح..!');
          }

          ///
          if (!SurveyCondition()
              .conditionHHSQ5NumUnder18(editingController, context)) {
          } else if (!SurveyCondition()
              .conditionHHSQ5NumAdults(editingController, context)) {
          } else if (!SurveyCondition().validateHHSQ81(context)) {
          } else if (!SurveyCondition().validateHHSQ82(context)) {
          } else if (HhsStatic.householdQuestions.hhsNumberSeparateFamilies !=
              editingController.q6peopleUnder18.length.toString()) {
            var num = HhsStatic.householdQuestions.hhsNumberSeparateFamilies;
            showError(
              context,
              ShowErrorDialog(
                title: "سؤال 4 !! يجب إضافة باقى الاسر المنفصلة",
                content:
                    "سؤال 4 .يجب إضافة كافة الاسر المنفصلة المختارة فى سؤال رقم 3 .\n عدد الاسر المنفصلة هو $num",
              ),
            );
          } else if (!SurveyCondition().validateHHSQ83(context)) {
          } else if (!SurveyCondition().numberParcelsDeliveries(context)) {
          } else {
            await validationService.determinePosition(context).then((value) {
              surveyPt.hhsAddressLat = value.latitude.toString();
              surveyPt.hhsAddressLong = value.longitude.toString();
            }).onError(
              (error, stackTrace) {
                debugPrint(error.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("يجب تشغيل خدمة تحديد الموقع"),
                    duration: Duration(seconds: 3),
                    elevation: 1,
                  ),
                );
              },
            );

              CheckHHSValidation.validate(context);

          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("يوجد خطأ بالبيانات"),
              duration: Duration(seconds: 3),
              elevation: 1,
            ),
          );
        }
      },
      isWidget: true,
      text: "التالي",
      widget: const Icon(Icons.arrow_forward),
    );
  }
}
