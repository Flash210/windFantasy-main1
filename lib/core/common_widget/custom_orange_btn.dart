import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';

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
