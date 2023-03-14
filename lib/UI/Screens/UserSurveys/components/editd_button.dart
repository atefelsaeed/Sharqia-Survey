import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

import '../../../../Data/HouseholdPart1/empty_data.dart';
import '../../../../Data/app_constants.dart';
import '../../../../Models/user_serveys_model.dart';
import '../../../../Resources/colors.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../Survey/syrvey_screen.dart';

class EditedButton extends StatelessWidget {
  const EditedButton({Key? key, required this.function}) : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
      },
      //edited
      isWidget: true,
      background: Colors.green,
      text: 'تم التعديل',
      btnWidth: width(context) * .35,
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.function,
    required this.itemSurveyModel,
  }) : super(key: key);
  final Function function;
  final UserSurveysModelData itemSurveyModel;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
        AppConstants.isResetHHS = true;
        AppConstants.isResetPerson = true;
        AppConstants.isResetTrip = true;
        AppConstants.isResetVec = true;
        HHSEmptyData.emptyData();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurveyScreen(
              itemSurveyModel: itemSurveyModel,
            ),
          ),
        );
      },
      //edited
      isWidget: true,
      background: ColorManager.yellowLiner,
      text: 'تعديل الاستبيان',
      btnWidth: width(context) * .35,
    );
  }
}

class FilledButton extends StatelessWidget {
  const FilledButton({Key? key, required this.function}) : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () {
        function();
      },
      //edited
      isWidget: true,
      background: ColorManager.grayColor,
      text: 'تم الاستبيان',
      btnWidth: width(context) * .35,
    );
  }
}

class NotFilledButton extends StatefulWidget {
  const NotFilledButton({
    Key? key,
    required this.function,
    required this.itemSurveyModel,
  }) : super(key: key);
  final Function function;
  final UserSurveysModelData itemSurveyModel;

  @override
  State<NotFilledButton> createState() => _NotFilledButtonState();
}

class _NotFilledButtonState extends State<NotFilledButton> {
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      function: () async {
        widget.function();
        //This values used to check if update survey data called for first time or not.
        //For this action the survey is not filled,although this values false.
        AppConstants.isResetHHS = false;
        AppConstants.isResetPerson = false;
        AppConstants.isResetTrip = false;
        AppConstants.isResetVec = false;
        //Set isFilled bool value. To check if the user finished survey or not.
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setBool(AppConstants.isFilled, true);
        //Empty Survey cached values.
        HHSEmptyData.emptyData();
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurveyScreen(
                itemSurveyModel: widget.itemSurveyModel,
              ),
            ),
          );
        }
      },
      isWidget: true,
      background: ColorManager.primaryColor,
      text: 'بدأ استبيان',
      btnWidth: width(context) * .35,
    );
  }
}
