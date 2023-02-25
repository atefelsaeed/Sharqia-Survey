import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/field_widget.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';

import '../widgets/editing_controler3.dart';

class Q81 extends StatefulWidget {
  EditingController3 editingController3;

  Q81({super.key, required this.editingController3});

  @override
  State<Q81> createState() => _Q81State();
}

class _Q81State extends State<Q81> {
  bool hasBycle = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text:
                    "7. كم عدد الدراجات الهوائية التي تمتلكها أو تستخدمها هذه الأسرة؟",
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
              value: hasBycle,
              onChanged: (bool? value) {
                setState(() {
                  hasBycle = value!;
                  if (hasBycle == true) {
                    widget.editingController3.peopleAdults18.text = '0';
                    widget.editingController3.peopleUnder18.text = '0';
                    widget.editingController3.totalNumber.text = '0';
                  } else {
                    widget.editingController3.peopleAdults18.text = '';
                    widget.editingController3.peopleUnder18.text = '';
                    widget.editingController3.totalNumber.text = '';
                  }
                });
              })
        ]),
        AppSize.spaceHeight2(context),
        Field(
          function: () {},
          showDeleteIcon: false,
          peopleAdults18: widget.editingController3.peopleAdults18,
          peopleUnder18: widget.editingController3.peopleUnder18,
          totalNumberOfVecText: "إجمالي عدد الدراجات الهوائية",
          totalNumberOfVec: widget.editingController3.totalNumber,
          peopleAdults18Text: "عدد الدرجات للبالغين + 18 ",
          peopleUnder18Text: "عدد الدرجات للأطفال اقل من 18",
          isHome: hasBycle,
        )
      ],
    );
  }
}
