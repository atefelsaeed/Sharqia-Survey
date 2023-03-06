import 'package:flutter/material.dart';

import '../../Helper/validator.dart';
import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class MyTextForm extends StatefulWidget {
  final String label;
  TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? title;
  final double? widthForm;
  bool? isPassword;
  bool? readOnly;
  IconData? suffix;
  bool? isNumber = false;
  final Function? suffixPressed;
  String? Function(String?)? validator;
 final Function()onTap;
  Function(String?)? onChanged;
  Iterable<String>? autofillHints;
  String? errorText;
  final Widget? prefixIcon;

  MyTextForm(
      {this.controller,
      Key? key,
      this.errorText,
      this.validator,
      this.readOnly,
      this.isNumber,
      this.keyboardType,
      this.title,
      this.widthForm,
      this.suffixPressed,
      this.isPassword,
      this.suffix,
      this.prefixIcon,
     required this.onTap,
      this.onChanged,
      this.autofillHints,
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
          width: widget.widthForm ?? width(context) * .45,
          child: TextFormField(
            controller: widget.controller,
            readOnly: widget.readOnly ?? false,
            onTap: () {
              if (widget.controller!.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: widget.controller!.text.length - 1))) {
                setState(() {
                  widget.controller!.selection = TextSelection.fromPosition(
                      TextPosition(offset: widget.controller!.text.length));
                });
              }
              widget.onTap();
            },
            textAlign: TextAlign.right,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ColorManager.black,
                fontSize: height(context) * .015),
            validator: (String? val) => widget.isNumber ?? false
                ? Validator.validateEmpty(
                    value: val,
                    message: 'يجب يجب إعطاء إجابة!',
                  )
                : Validator.validateName(
                    value: val!,
                    message: 'يجب يجب إعطاء إجابة صحيحة!',
                  ),
            decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: widget.suffix != null
                  ? IconButton(
                      onPressed: () {
                        widget.suffixPressed!();
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
            onChanged: widget.onChanged,
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
