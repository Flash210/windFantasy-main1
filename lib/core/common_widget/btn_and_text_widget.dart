import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: InkWell(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/back2.png',
            width: size.width * 0.07,
            height: size.height * 0.07,
          ),
        ),
      ),
    );
  }
}


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



class CustomOrangeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? iconColor;
  final double? customWidh;

  const CustomOrangeButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onTap,
    this.icon,
    this.iconColor,
    this.customWidh,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.black,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: MyColors.kPrimaryColor,
            ),
            color: backgroundColor,
          ),
          width: customWidh,
          height: ScreenUtils.getHeight(context) * 0.064,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              // CustomAnimatedText(text: text, color: textColor, fontSize: 14),
              if (icon != null) // Conditionally add icon
                Icon(
                  icon,
                  color: iconColor,
                ),
            ],
          ),
        ));
  }
}

