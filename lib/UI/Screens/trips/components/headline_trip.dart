import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_point.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/item_text_span.dart';
import '../../../Widgets/text.dart';

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                // CircleAvatar(
                //     backgroundColor: ColorManager.black,
                //     radius: width(context) * .010),
                ItemPoint(),
                // AppSize.spaceHeight05(context),
                // Container(
                //   color: ColorManager.black,
                //   width: width(context) * .03,
                //   height: height(context) * .003,
                // )
              ],
            ),
            AppSize.spaceWidth1(context),
            SizedBox(
              width: width(context)*.8,
              child: TextGlobal(
                text: text,
                fontSize:width(context) * .04,
                color: ColorManager.black,
                fontWeight: FontWeight.w800,
              ),
            ),

          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );}
}
