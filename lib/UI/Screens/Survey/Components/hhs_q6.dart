import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../actions/action_survey_screen.dart';
import '../widgets/list_view_check_box_orange.dart';

class HHsQ6 extends StatelessWidget{
  const HHsQ6({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ActionSurveyProvider>(context);
   return ListViewCheckBoxOrange(
      map: QuestionsData.qh7,
      onChange: (ChangeBoxResponse r) {
        validationService.q7(r);
        /*  HhsStatic.householdQuestions.hhsNumberYearsInAddress =
                              r.val;*/
      },
      title:
      "6.كم سنة عشت أنت / عائلتك في هذا العنوان المحدد؟",
      question: QuestionsData
          .qh7[QuestionsData.qh7.keys.first]!
          .toList(),
      subTitle: "",
    );
  }

}