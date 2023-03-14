import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class InputNumberTitle extends StatelessWidget {
  const InputNumberTitle({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height(context) * .02),
      width: width(context) * .25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextGlobal(
            text: title,
            fontSize: width(context) * .03,
            color: ColorManager.grayColor,
          ),
          AppSize.spaceHeight1(context),
          MyTextForm(
            label: "",
            controller: controller,
            widthForm: width(context) * .15,
            onChanged: (value) {

            },
            keyboardType: TextInputType.number,
            isNumber: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
