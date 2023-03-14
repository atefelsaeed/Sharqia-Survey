import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/custom_buttton.dart';

class SaveAndFinish {
  static saveAndFinish(context, List<String> list,Function function) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        title: const Center(child: Text('هل أنت متأكد !!!')),
        content: Text("''"
            "هؤلاء الافراد ليس لديهم رحلات\n"
            "${list.toString()}\n\n"
            "هل توافق على حفظ الاستمارة من غير رحلات هؤلاء الافراد !!"
            ""
            "''"),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                function: () {
                  Navigator.of(context).pop(false);
                },
                isWidget: true,
                text: 'لا أوافق',
                background: ColorManager.primaryColor,
              ),
              AppSize.spaceWidth3(context),
              DefaultButton(
                function: () => function(),
                // textColor: ColorManager.yellowLiner,
                isWidget: true,
                text: 'أوافق',
                background: ColorManager.grayColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
