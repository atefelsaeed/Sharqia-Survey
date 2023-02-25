import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../actions/action_survey_screen.dart';
import '../widgets/text_form_row.dart';

class HHSQ1 extends StatelessWidget {
  const HHSQ1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ActionSurveyProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: HhsStatic.householdQuestions.hhsDwellingType != null
                  ? Text(HhsStatic.householdQuestions.hhsDwellingType??'')
                  : const Text('إختار'),
              hint: "1. وصف المسكن؟",
              options:
                  QuestionsData.qh1[QuestionsData.qh1.keys.first]!.toList(),
              onChange: (String? p) {
                debugPrint(p);
               validationService.HHSQ1(p.toString());
              },
            ),
            (HhsStatic.householdQuestions.hhsDwellingType ==
                        "شقة - عائلة واحدة" ||
                    HhsStatic.householdQuestions.hhsDwellingType ==
                        "شقة -مشتركة بين عائلتين أو أكثر")
                ? TextForm(
                    controller:
                        HhsStatic.householdQuestions.hhsNumberApartments,
                    text: "عدد الشقق",
                    label: "عدد الشقق",
                    keyboardType: TextInputType.number,
                    isNumber: true,
                  )
                : Container(),
            HhsStatic.householdQuestions.hhsDwellingType == "أخر"
                ? TextForm(
                    controller:
                        HhsStatic.householdQuestions.hhsDwellingTypeOther!,
                    text: "1. وصف المسكن؟",
                    label: "1. وصف المسكن؟",
                    isNumber: false,
                  )
                : Container(),
          ],
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: HhsStatic.householdQuestions.hhsNumberBedRooms,
              text: "عدد الغرف",
              label: "عدد الغرف",
              keyboardType: TextInputType.number,
              isNumber: true,
            ),
            TextForm(
              controller: HhsStatic.householdQuestions.hhsNumberFloors,
              text: "عدد الأدوار",
              label: "عدد الأدوار",
              keyboardType: TextInputType.number,
              isNumber: true,
            ),
          ],
        ),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}
