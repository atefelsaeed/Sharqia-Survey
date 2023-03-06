// import 'package:flutter/cupertino.dart';
// import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
// import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
// import '../../../Widgets/dropdown_form_input.dart';
// import '../actions/action_survey_screen.dart';
//
// class DemolishedArea extends StatelessWidget{
//   EditingController editingController;
//   DemolishedArea(this. editingController, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     final validationService = Provider.of<ActionSurveyProvider>(context);
//     // TODO: implement build
//     if( HhsStatic.householdQuestions.hhsIsDemolishedAreas ==
//         true){
//      return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           DropDownFormInput(
//             onChange: (String? p) {
//              validationService.qDArea(editingController, p.toString());
//             },
//             label: HhsStatic.householdQuestions
//                 .hhsDemolishedAreas !=
//                 null
//                 ? Text(HhsStatic.householdQuestions
//                 .hhsDemolishedAreas ??
//                 '')
//                 : const Text('إختار'),
//             hint: "المنطقة المهدومة",
//             options: QuestionsData.qh6_2[
//             QuestionsData.qh6_2.keys.first]!
//                 .toList(),
//           ),
//         ],
//       );
//     }else{
//       return Container();
//
//     }
//   }
// }