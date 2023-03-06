import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/headline.dart';

class HHSHeader extends StatelessWidget {
  const HHSHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        const HeadlinePerson(text: 'HHS-'),
        AppSize.spaceHeight1(context),
        Divider(thickness: 1,color: ColorManager.primaryColor,),
      ],
    );
  }
}
