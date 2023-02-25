import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/font_manager.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

class ItemTextSpan extends StatelessWidget {
  const ItemTextSpan({
    Key? key,
    required this.title,
    required this.subTitle,
    this.fontSize,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.margin1(context)),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: "$title: ",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: fontSize ?? FontSize.textS16(context),
                    color: ColorManager.black)),
            TextSpan(
                text: subTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize ?? FontSize.textS16(context),
                    color: ColorManager.grayColor)),
          ],
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
    );
  }
}
