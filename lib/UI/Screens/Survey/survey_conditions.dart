import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';
import 'package:sharqia_household_survey/UI/Widgets/show_dialog_error.dart';

import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/survey_hhs.dart';

class SurveyCondition {
  bool conditionHHSQ5NumAdults(EditingController editingController, context) {
    int houseHoldLength = 0;
    if (editingController.peopleAdults18.text.isEmpty) {
      houseHoldLength = 0;
    } else {
      houseHoldLength = int.parse(editingController.peopleAdults18.text);
    }

    int numAdults = 0;

    for (int i = 0; i < editingController.q6peopleAdults18.length; i++) {
      numAdults =
          int.parse(editingController.q6peopleAdults18[i].text) + numAdults;
    }

    if (houseHoldLength > numAdults) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد البالغن سؤال 5 !!',
          content:
              'بجب ان لا يزيد عدد البالغين سؤال 5 عن إجمالى عدد البالغين في سؤال 4..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  bool conditionHHSQ5NumUnder18(EditingController editingController, context) {

    int houseHoldLength = 0;
    if (editingController.peopleUnder18.text.isEmpty) {
      houseHoldLength = 0;
    } else {
      houseHoldLength = int.parse(editingController.peopleUnder18.text);
    }
    int numAdults = 0;
    for (int i = 0; i < editingController.q6peopleUnder18.length; i++) {
      numAdults =
          int.parse(editingController.q6peopleUnder18[i].text) + numAdults;
    }
    if (houseHoldLength > numAdults) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد الأطفال سؤال 5 !!',
          content:
              'بجب ان لا يزيد عدد الأطفال سؤال 5 عن إجمالى عدد الأطفال في سؤال 4..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  bool numberParcelsDeliveries(context) {
    ///numberParcels
    int numberParcels = 0;

    if (VehModel.vehiclesModel.numberParcels.text.isEmpty) {
      numberParcels = 0;
    } else {
      numberParcels = int.parse(
          VehModel.vehiclesModel.numberParcels.text.replaceAll('.', ''));
    }

    ///numberFood
    int numberFood = 0;

    if (VehModel.vehiclesModel.numberFood.text.isEmpty) {
      numberFood = 0;
    } else {
      numberFood =
          int.parse(VehModel.vehiclesModel.numberFood.text.replaceAll('.', ''));
    }

    ///numberGrocery
    int numberGrocery = 0;

    if (VehModel.vehiclesModel.numberGrocery.text.isEmpty) {
      numberGrocery = 0;
    } else {
      numberGrocery = int.parse(
          VehModel.vehiclesModel.numberGrocery.text.replaceAll('.', ''));
    }

    ///numberOtherParcels
    int numberOtherParcels = 0;

    if (VehModel.vehiclesModel.numberOtherParcels.text.isEmpty) {
      numberOtherParcels = 0;
    } else {
      numberOtherParcels = int.parse(
          VehModel.vehiclesModel.numberOtherParcels.text.replaceAll('.', ''));
    }

    ///numberParcelsDeliveries
    int numberParcelsDeliveries = 0;

    if (VehModel.vehiclesModel.numberParcelsDeliveries.text.isEmpty) {
      numberParcelsDeliveries = 0;
    } else {
      numberParcelsDeliveries = int.parse(VehModel
          .vehiclesModel.numberParcelsDeliveries.text
          .replaceAll('.', ''));
    }

    int total = numberParcels + numberGrocery + numberFood + numberOtherParcels;

    if (numberParcelsDeliveries != total) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد الطلبات المنزلية !!',
          content:
              'عدد الطلبات في الحقول التفصيلية يجب أن يساوي عدد الطلبات المنزلية..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  void showError(context, Widget widget) => showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return widget;
      });

  ///validateHHSQ81
  bool validateHHSQ81(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    int peopleAdults18 = surveyPt.hhsPCAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsPCChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCChildrenBikesNumber);
    int totalNumber = surveyPt.hhsPCTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ81');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد الدراجات الهوائية !!',
          content:
              ' عدد الدرجات للاطفال+ عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///validateHHSQ82
  bool validateHHSQ82(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    int peopleAdults18 = surveyPt.hhsECAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsECChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECChildrenBikesNumber);
    int totalNumber = surveyPt.hhsECTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ82');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد الدراجات النارية !!',
          content:
              ' عدد الدرجات للاطفال+ عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///validateHHSQ83
  bool validateHHSQ83(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    int peopleAdults18 = surveyPt.hhsESAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsESChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESChildrenBikesNumber);
    int totalNumber = surveyPt.hhsESTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ83');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      showError(
        context,
        const ShowErrorDialog(
          title: 'عدد الدراجات الإلكترونية(إسكوتر) !!',
          content:
              ' عدد الدرجات للاطفال+ عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!',
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
