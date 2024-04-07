import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomAnimatedText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      maxLines: 1,
      minFontSize: 8,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.bold),
    );
  }
}
