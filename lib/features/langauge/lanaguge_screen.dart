import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';

import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/entry%20point/entry_point.dart';
import 'package:front/generated/l10n.dart';

import '../splash screen/widgets/langauge_bottom_sheet.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  LanguageScreenState createState() => LanguageScreenState();
}

class LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: MyColors.kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoScreen(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: ScreenUtils.getWidth(context) * 0.87,
              height: ScreenUtils.getHeight(context) * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomOrangeButton(
                    customWidh: ScreenUtils.getWidth(context) * 0.6,
                    text: currentLocale.languageCode == 'fr'
                        ? "Frensh"
                        : "English",
                    textColor: MyColors.kPrimaryColor,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const LanguageBottomSheet(),
                      );
                    },
                    backgroundColor: MyColors.kWhite,
                    icon: Icons.arrow_drop_down,
                    iconColor: MyColors.kPrimaryColor,
                  ),

                  const SizedBox(height: 10),

                  // Next button
                  CustomOrangeButton(
                    customWidh: ScreenUtils.getWidth(context) * 0.6,
                    textColor: MyColors.kWhite,
                    text: S.of(context).Next,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EntryPointScreen(),
                          ));
                    },
                    backgroundColor: MyColors.kPrimaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtils.getHeight(context) * 0.1),
          ],
        ),
      ),
    );
  }
}
