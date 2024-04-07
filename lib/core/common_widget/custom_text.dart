import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final Color? color;
final TextStyle? style;

  const MyCustomText({
    required this.text,
    this.textAlign,
    super.key,
    this.color,
    this.style
  });
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      style:style,
      textAlign: textAlign,
    );
  }
}
