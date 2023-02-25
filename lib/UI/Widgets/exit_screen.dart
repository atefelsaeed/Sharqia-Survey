import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

import '../../Resources/colors.dart';
import 'custom_buttton.dart';

class OnExitScreen {
  static Future<bool> onWillPop(context) async {
    return (await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            title: const Center(child: Text('هل أنت متأكد!')),
            content: const Text('هل تريد الخروج من الاستبيان؟'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    function: () => Navigator.of(context).pop(false),
                    isWidget: true,
                    text: 'لا',
                    background: ColorManager.primaryColor,
                  ),
                  AppSize.spaceWidth3(context),
                  DefaultButton(
                    function: () => Navigator.of(context).pop(true),
                    // textColor: ColorManager.yellowLiner,
                    isWidget: true,
                    text: 'نعم',
                    background: ColorManager.grayColor,
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
  }
}
