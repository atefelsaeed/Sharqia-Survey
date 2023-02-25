import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';

class TextTrip extends StatelessWidget {
  final int index;

  const TextTrip({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int indexx = index + 1;
    return TextGlobal(
      text: "رحلة  ${indexx.toString()}",
      fontSize: height(context) * .023,
      color: ColorManager.orangeTxtColor,
    );
  }
}
