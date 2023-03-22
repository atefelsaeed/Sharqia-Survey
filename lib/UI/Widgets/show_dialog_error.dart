import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

import '../../Resources/colors.dart';
import 'custom_buttton.dart';

class ShowErrorDialog extends StatelessWidget {
  const ShowErrorDialog(
      {Key? key, required this.title, required this.content})
      : super(key: key);
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      title: Center(child: Text(title)),
      content: SizedBox(
        child: Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      actions: <Widget>[
        Center(
            child: SizedBox(
          height: height(context) * .06,
          width: width(context) * .45,
          child: DefaultButton(
            function: () {
              Navigator.of(context,rootNavigator: true).pop();
            },
            // textColor: ColorManager.yellowLiner,
            isWidget: true,
            text: 'أوافق',
            background: ColorManager.primaryColor,
          ),
        )),

      ],
    );
  }
}
