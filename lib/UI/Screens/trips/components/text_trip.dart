import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/widgets/text.dart';

class TextTrip extends StatelessWidget {
  final int index;

  const TextTrip({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripNumber = index + 1;
    return TextGlobal(
      text: 'رحلة $tripNumber',
      fontSize: height(context) * 0.023,
      color: ColorManager.orangeTxtColor,
    );
  }
}
