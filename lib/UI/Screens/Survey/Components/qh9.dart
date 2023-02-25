import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../actions/action_survey_screen.dart';

class QH9 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ActionSurveyProvider>(context);
   return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropDownFormInput(
          label: HhsStatic.householdQuestions
              .hhsTotalIncome !=
              ''
              ? Text(HhsStatic.householdQuestions
              .hhsTotalIncome ??
              '')
              : const Text('إختار'),
          hint:
          "8.متوسط دخل جميع أفراد الاسرة الشهري مع المزايا؟",
          options: QuestionsData
              .qh9[QuestionsData.qh9.keys.first]!
              .toList(),
          onChange: (String p) {
            validationService.qh9(p);
            //HhsStatic.householdQuestions.hhsTotalIncome = p;
          },
        ),
      ],
    );
  }


}