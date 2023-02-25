// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/text_form_row.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';

import '../actions/action_survey_screen.dart';

class ListQ7 extends StatelessWidget {
  final String title;
  final String subTitle;
  List<dynamic> question;
  final TextEditingController textEditingController;

  ListQ7(
      {super.key,
      required this.title,
      required this.question,
      required this.subTitle,
      required this.textEditingController});

  int chosenIndex = 0;

  bool indexBool = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ActionSurveyProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: title,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width(context) - 140,
              child: TextGlobal(
                text: subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  TextGlobal(
                    text: question[index]["value"],
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
                      value: question[index]["isChick"],
                      onChanged: (bool? value) {
                       validationService.listQ7(question, index, chosenIndex, value);
                      }),
                ]),
              )),
        ),
        question[chosenIndex]["isChick"] =
            true && question[chosenIndex]["value"] == true
                ? TextForm(
                    controller: textEditingController,
                    label: 'Name of the demolished area',
                    text: 'Name of the demolished area',
                  )
                : Container()
      ],
    );
  }
}
