import 'package:flutter/cupertino.dart';

class TextGlobal extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  FontWeight? fontWeight;

  TextGlobal({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.right,
    );
  }
}
