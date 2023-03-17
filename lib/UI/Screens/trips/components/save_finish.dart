import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Widgets/custom_buttton.dart';

class SaveAndFinish {
  static Future<void> showSaveAndFinishDialog(
    BuildContext context,
    List<String> list,
    Function onConfirm,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        title: const Center(
          child: Text('هل أنت متأكد !!!'),
        ),
        content: Text(
          "''"
          "هؤلاء الافراد ليس لديهم رحلات\n"
          "${list.join(", ")}\n\n"
          "هل توافق على حفظ الاستمارة من غير رحلات هؤلاء الافراد !!"
          "''",
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                function: () => Navigator.of(context).pop(false),
                text: 'لا أوافق',
                background: ColorManager.primaryColor,
                isWidget: true,
              ),
              AppSize.spaceWidth3(context),
              DefaultButton(
                function: () => onConfirm(),
                text: 'أوافق',
                background: ColorManager.grayColor,
                isWidget: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
