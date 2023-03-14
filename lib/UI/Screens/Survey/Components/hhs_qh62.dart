// import 'package:flutter/cupertino.dart';
// import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
// import '../actions/action_survey_screen.dart';
// import '../widgets/list_view_check_box_orange.dart';
//
// class HHSQH62 extends StatelessWidget {
//   EditingController controller;
//
//   HHSQH62(this.controller);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     final validationService = Provider.of<ActionSurveyProvider>(context);
//     return ListViewCheckBoxOrange(
//       map: QuestionsData.qh7_2,
//       onChange: (ChangeBoxResponse r) {
//         // validationService.q72(r, controller.yes);
//
//         /* setState(() {
//                             if (r.val == "نعم" && r.check == true) {
//                               HhsStatic.householdQuestions
//                                   .hhsIsDemolishedAreas = true;
//                               yes.text = '';
//                             } else {
//                               HhsStatic.householdQuestions
//                                   .hhsIsDemolishedAreas = false;
//                               yes.text = 'لا';
//                             }
//                           });*/
//       },
//       isListView: true,
//       title:
//           "هل انتقلت إلى هنا من أي منطقة من المناطق المهدومة في جدة ، إذا كانت الإجابة بنعم أي واحدة",
//       question: QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first]!.toList(),
//       subTitle: "",
//     );
//   }
// }
