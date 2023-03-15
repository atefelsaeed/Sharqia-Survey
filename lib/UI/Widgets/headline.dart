import 'package:flutter/cupertino.dart';

import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';
import 'text.dart';

class HeadlinePerson extends StatelessWidget {
  final String text;

  const HeadlinePerson({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.spaceWidth1(context),
        Expanded(
          flex: 1,
          child: TextGlobal(
            text: text,
            fontSize: width(context) * .025,
            fontWeight: FontWeight.w600,
            color: ColorManager.orangeTxtColor,
          ),
        ),
        AppSize.spaceWidth2(context),
        Expanded(
          flex: 1,
          child: Text(
            'مسح يوميات الذهاب المنزلي',
            style: TextStyle(color: ColorManager.blackText),
          ),
        )
      ],
    );
  }
}

class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: title,
                fontSize: height(context) * .02,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
