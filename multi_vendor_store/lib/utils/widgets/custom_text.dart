import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextDecoration? textDecorate;
  TextAlign? textAlign;
  int? maxLine;
  TextStyle? style;

  CustomText(
      {super.key,
      required this.text,
      this.textAlign,
      this.style,
      this.maxLine,
      this.textDecorate});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style,
    );
  }
}
