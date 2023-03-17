import 'package:flutter/material.dart';

import '../../Helper/validator.dart';
import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

extension DoubleExtensions on double {
  double orDefault(double defaultValue) {
    return this ?? defaultValue;
  }
}

extension IntExtensions on int {
  int orDefault(int defaultValue) {
    return this ?? defaultValue;
  }
}

extension StringExtensions on String {
  String orDefault(String defaultValue) {
    return this ?? defaultValue;
  }
}

extension BoolExtensions on bool {
  bool orDefault(bool defaultValue) {
    return this ?? defaultValue;
  }
}

extension TextEditingControllerExtensions on TextEditingController {
  TextEditingController orDefault(TextEditingController defaultValue) {
    return this ?? defaultValue;
  }
}

extension FunctionExtensions on Function {
  Function orDefault(Function defaultValue) {
    return this ?? defaultValue;
  }
}

extension IconDataExtensions on IconData {
  IconData orDefault(IconData defaultValue) {
    return this ?? defaultValue;
  }
}

class MyTextForm extends StatefulWidget {
  final String label;
  TextInputType? keyboardType;
  final TextEditingController? controller;
  final double? widthForm;
  bool? readOnly;
  IconData? suffix;
  bool? isNumber = false;
  final Function? suffixPressed;
  String? Function(String?)? validator;
  final Function() onTap;
  Function(String?)? onChanged;
  final Widget? prefixIcon;

  MyTextForm(
      {this.controller,
      Key? key,
      this.validator,
      this.readOnly,
      this.isNumber,
      this.keyboardType,
      this.widthForm,
      this.suffixPressed,
      this.suffix,
      this.prefixIcon,
      required this.onTap,
      this.onChanged,
      required this.label})
      : super(key: key);

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.widthForm?.orDefault(width(context) * .45) ??
              width(context) * .45,
          child: TextFormField(
            controller: widget.controller?.orDefault(TextEditingController()) ??
                TextEditingController(),
            readOnly: widget.readOnly?.orDefault(false) ?? false,
            onTap: () {
              if (widget.controller!.text.isNotEmpty &&
                  widget.controller?.text != null) {
                if (widget.controller!.selection ==
                    TextSelection.fromPosition(TextPosition(
                        offset: widget.controller!.text.length - 1))) {
                  setState(() {
                    widget.controller!.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.controller!.text.length));
                  });
                }
                widget.onTap();
              }
            },
            textAlign: TextAlign.right,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            // autofocus: true,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ColorManager.black,
                fontSize: height(context) * .015),
            validator: (String? val) =>
                widget.isNumber?.orDefault(false) ?? false
                    ? Validator.validateEmpty(
                        value: val?.orDefault(''),
                        message: 'يجب يجب إعطاء إجابة!',
                      )
                    : Validator.validateName(
                        value: val?.orDefault('') ?? '',
                        message: 'يجب يجب إعطاء إجابة صحيحة!',
                      ),
            decoration: InputDecoration(
              labelText: widget.label.orDefault(''),
              suffixIcon: widget.suffix != null
                  ? IconButton(
                      onPressed: () {
                        widget.suffixPressed!() ?? () {};
                      },
                      icon: Icon(
                        widget.suffix,
                        color: ColorManager.gray2Color,
                        size: width(context) * .06,
                      ))
                  : null,
              prefixIcon: widget.prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.5, color: ColorManager.primaryColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: ColorManager.error),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textDirection: TextDirection.rtl,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            onChanged: widget.onChanged ?? (val) {},
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
