import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_point.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HouseHoldMember extends StatelessWidget {
  const HouseHoldMember({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const ItemPoint(),
            TextGlobal(
              text: "الجزء الأول أُسرَة",
              fontSize: height(context) * .023,
              color: ColorManager.black,
            ),
          ])
        ]),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
