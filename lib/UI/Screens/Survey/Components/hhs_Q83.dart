import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/field_widget.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';

import '../actions/action_survey_screen.dart';
import '../widgets/editing_controler3.dart';

class HHSQ83 extends StatefulWidget {
  EditingController3 editingController3;

  HHSQ83({super.key, required this.editingController3});

  @override
  State<HHSQ83> createState() => _HHSQ83State();
}

class _HHSQ83State extends State<HHSQ83> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActionSurveyProvider>(context, listen: false);

    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text:
                    "كم عدد الدراجات الإلكترونية(إسكوتر) التي تمتلكها أو تستخدمها هذه الأسرة؟",
                fontSize: height(context) * .017,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(children: [
          TextGlobal(
            text: "لا يوجد",
            fontSize: height(context) * .02,
            color: ColorManager.grayColor,
          ),
          Checkbox(
              side: BorderSide(
                color: ColorManager.orangeTxtColor,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              checkColor: ColorManager.whiteColor,
              focusColor: ColorManager.orangeTxtColor,
              activeColor: ColorManager.orangeTxtColor,
              value: provider.hasBicycleQ83,
              onChanged: (bool? value) {
                setState(() {
                  provider.hasBicycleQ83 = value!;
                });
                debugPrint(value.toString());
                provider.hhsQ83(widget.editingController3, value!);
              })
        ]),
        AppSize.spaceHeight2(context),
        Field(
          function: () {},
          showDeleteIcon: false,
          peopleAdults18: widget.editingController3.peopleAdults18,
          peopleUnder18: widget.editingController3.peopleUnder18,
          totalNumberOfVecText: "إجمالي عدد الدراجات الإلكترونية(إسكوتر)",
          totalNumberOfVec: widget.editingController3.totalNumber,
          peopleAdults18Text: "عدد الدرجات للبالغين + 18 ",
          peopleUnder18Text: "عدد الدرجات للأطفال اقل من 18",
          isHome: provider.hasBicycleQ83,
        )
      ],
    );
  }
}
