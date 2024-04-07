
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/generated/l10n.dart';

DefaultTextStyle buildWelcomeText(BuildContext context) {
    return DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 20.0, color: MyColors.kPrimaryColor
                  //fontFamily: 'Agne',
                  ),
              child: AnimatedTextKit(
                totalRepeatCount: 1000,
                animatedTexts: [
                  TypewriterAnimatedText(
                    S.of(context).WelcomeSection,
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                onTap: () {
                  // print("Tap Event");
                },
              ),
            );
  }