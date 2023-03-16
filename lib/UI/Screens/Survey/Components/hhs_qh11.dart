import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/hhs_models.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/text_form_row.dart';

class HhsQH11 extends StatelessWidget {
  const HhsQH11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller: HhsStatic.householdQuestions.hhsNumberShoppingTrip,
          onChanged: (value) {
            HhsStatic.householdQuestions.hhsNumberShoppingTrip.text = value!;
          },
          text: "عدد رحلات التسوق في الاسبوع",
          label: "عدد رحلات التسوق",
          keyboardType: TextInputType.number,
          isNumber: true,
        ),
        TextForm(
          controller: HhsStatic.householdQuestions.hhsNumberHealthTrip,
          onChanged: (value) {
            HhsStatic.householdQuestions.hhsNumberHealthTrip.text = value!;
          },
          text: "عدد رحلات الصحي في الأسبوع",
          label: "عدد رحلات الصحي",
          keyboardType: TextInputType.number,
          isNumber: true,
        ),
      ],
    );
  }
}
