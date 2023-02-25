import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../actions/action_survey_screen.dart';
import '../widgets/list_view_check_box_orange.dart';

class HHsQh4 extends StatelessWidget{
  EditingController editingController;

  HHsQh4({super.key,required this.editingController});

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ActionSurveyProvider>(context);
    // TODO: implement build
  return  ListViewCheckBoxOrange(
      map: QuestionsData.qh4,
      onChange: (ChangeBoxResponse r) {
        debugPrint(r.toString());

          validationService.q4(r, editingController.q6totalNumberOfVec,editingController. q6peopleUnder18,editingController. q6peopleAdults18);


        /*   if (r.check == true) {
                            HhsStatic.householdQuestions
                                .hhsNumberSeparateFamilies = r.val;
                            setState(() {
                              while (int.parse(r.val) <
                                  q6totalNumberOfVec.length) {
                                q6peopleAdults18.removeLast();
                                q6peopleUnder18.removeLast();
                                q6totalNumberOfVec.removeLast();
                              }
                            });
                          } else {
                            setState(() {
                              q6peopleAdults18 = [TextEditingController()];
                              q6peopleUnder18 = [TextEditingController()];
                              q6totalNumberOfVec = [TextEditingController()];
                            });
                            HhsStatic.householdQuestions
                                .hhsNumberSeparateFamilies = "1";
                          }*/
      },
      title:
      "3.كم عدد العائلات المنفصلة التي تعيش في هذا العنوان؟",
      question: QuestionsData
          .qh4[QuestionsData.qh4.keys.first]!
          .toList(),
      subTitle:
      'يتم تعريف الأسرة المنفصلة على أنها من لا يشارك مصاريف المطبخ والوجبات مع العائلة الأخرى في نفس السكن)',
    );
  }
}