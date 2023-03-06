// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../actions/action_survey_screen.dart';

class HHSQ2 extends StatelessWidget {
  const HHSQ2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ActionSurveyProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              onChange: (String? p) {
                validationService.HHSQ2(p.toString());
              },
              label: HhsStatic.householdQuestions.hhsIsDwelling != null
                  ? Text(HhsStatic.householdQuestions.hhsIsDwelling ?? '')
                  : const Text('إختار'),
              hint: "2.ملكية المسكن؟",
              options:
                  QuestionsData.qh2[QuestionsData.qh2.keys.first]!.toList(),
            ),
          ],
        ),
        ((HhsStatic.householdQuestions.hhsIsDwelling == "أخر") ||
                ((HhsStatic.householdQuestions.hhsIsDwelling != null &&
                    !(QuestionsData.qh2[QuestionsData.qh2.keys.first]!.any(
                        (element) =>
                            element ==
                            HhsStatic.householdQuestions.hhsIsDwelling)))))
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text: "2.ملكية المسكن؟",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      )),
                  AppSize.spaceHeight1(context),
                  MyTextForm(
                    label: "2.ملكية المسكن؟",
                    onTap: () {  },
                    controller:
                        HhsStatic.householdQuestions.hhsIsDwellingOther!,
                    onChanged: (value) {
                      HhsStatic.householdQuestions.hhsIsDwelling = value;
                    },
                    // isNumber: true,

                    isNumber: false,
                  ),
                ],
              )
            : Container(),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}
