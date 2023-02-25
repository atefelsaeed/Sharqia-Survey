import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/headline.dart';
import '../../../Widgets/text.dart';

class VehiclesHeader extends StatelessWidget {
  const VehiclesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlinePerson(text: 'المركبات في المنزل'),
        AppSize.spaceHeight3(context),
        TextGlobal(
          text: " 1.  كم عدد المركبات الآلية المتوفرة للأسرة للاستخدام الشخصي؟",
          fontSize: height(context) * .02,
          color: ColorManager.black,
        ),
      ],
    );
  }
}
