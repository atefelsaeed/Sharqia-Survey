import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_point.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_text_span.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                ItemPoint(),
              ],
            ),
            AppSize.spaceWidth1(context),
            Expanded(
              child: TextGlobal(
                text: text,
                fontSize: width(context) * 0.03,
                color: ColorManager.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
