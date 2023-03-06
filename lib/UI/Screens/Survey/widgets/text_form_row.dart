import 'package:flutter/cupertino.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final double? fontSize;
  final String text;
  final bool? isNumber;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final Function(String?) onChanged;

  const TextForm({
    super.key,
    required this.controller,
    required this.label,
    required this.text,
    this.keyboardType,
    this.readOnly,
  required this.onChanged,
    this.isNumber,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: width(context) * .45,
            child: TextGlobal(
              text: text,
              fontSize: fontSize ?? height(context) * .02,
              color: ColorManager.black,
            )),
        AppSize.spaceHeight1(context),
        MyTextForm(
          label: label,
          controller: controller,
          readOnly: readOnly,
          isNumber: isNumber,
          onTap: () {  },
          onChanged: (val) {
            onChanged(val);
          },
          keyboardType: keyboardType ?? TextInputType.text,
          // isNumber: true,
        ),
      ],
    );
  }
}

class TextFormer extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String headLabel;
  final String text;
  final TextInputType? type;

  const TextFormer(
      {super.key,
      this.type,
      required this.controller,
      required this.label,
      required this.text,
      required this.headLabel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
            width: width(context) * .45,
            child: Row(
              children: [
                Expanded(
                    child: TextGlobal(
                  text: text,
                  fontSize: height(context) * .017,
                  color: ColorManager.black,
                ))
              ],
            )),
        AppSize.spaceHeight1(context),
        MyTextForm(
          label: "",
          controller: controller,
          onTap: () {  },
          keyboardType: type,
        ),
      ],
    );
  }
}
