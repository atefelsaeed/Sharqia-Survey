import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_point.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';

class DropDownFormInput2<T> extends StatelessWidget {
  final List<Map> options;
  final String? hint;
  Widget? label;
  final Function? onChange;

  final T? initial;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function(T?)? onSaved;

  DropDownFormInput2({
    Key? key,
    required this.options,
    this.hint,
    this.label = const SizedBox.shrink(),
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initial,
    this.validator,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: initial,
      validator:validator,
      /* (val) {
        if (val == null) return 'يجب يجب إعطاء إجابة!';
        return null;
      }*/
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      builder: (FormFieldState<T> field) => Column(
        children: [
          SizedBox(
              width: width(context) * .4,
              child: Text(
                hint.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black,
                    fontSize: height(context) * .02),
                textAlign: TextAlign.right,
              )),
          AppSize.spaceHeight1(context),
          SizedBox(
            width: width(context) * .4,
            height: height(context) * .1,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                      isExpanded: true,
                      hint: label ?? const Text('إختار'),
                      value: field.value,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      onChanged: (T? newValue) {
                        field.didChange(newValue);
                        field.save();
                        if (onChange != null) {
                          onChange!(newValue);
                        }
                      },
                      items: options
                          .map(
                            (Map v) => DropdownMenuItem<T>(
                              value: v["value"],
                              child: Text(v["value"].toString()),
                            ),
                          )
                          .toList(),
                    ),
                  )),
            ),
          ),
          field.hasError
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red[700], fontSize: 12),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class DropDownFormInput<T> extends StatelessWidget {
  final List<T> options;
  final String? hint;
  Widget? label;
  final Function? onChange;

  final T? initial;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function(T?)? onSaved;

  DropDownFormInput({
    Key? key,
    required this.options,
    this.hint,
    this.label = const SizedBox.shrink(),
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initial,
    this.validator,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: initial,
      validator:validator,
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      builder: (FormFieldState<T> field) => Column(
        children: [
          SizedBox(
              width: width(context) * .45 - 10,
              child: Row(
                children: [
                  // const ItemPoint(),
                  TextGlobal(
                    text: hint.toString(),
                    fontSize: width(context) * .03,
                    color: ColorManager.black,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              )),
          AppSize.spaceHeight1(context),
          SizedBox(
            width: width(context) * .45 - 10,
            height: height(context) * .1,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                      isExpanded: true,
                      hint: label ?? const Text('إختار'),
                      // const Text('إختار')
                      value: field.value,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      onChanged: (T? newValue) {
                        field.didChange(newValue);
                        field.save();
                        if (onChange != null) {
                          onChange!(newValue);
                        }
                      },
                      items: options
                          .map(
                            (T v) => DropdownMenuItem<T>(
                          value: v,
                          child: Text(v.toString()),
                        ),
                      )
                          .toList(),
                    ),
                  )),
            ),
          ),
          field.hasError
              ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                field.errorText!,
                style: TextStyle(color: Colors.red[700], fontSize: 12),
              ),
            ],
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
