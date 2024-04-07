import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/features/authentification/View/auth_screen.dart';
import 'package:front/generated/l10n.dart';

import '../../core/common_widget/custom_orange_btn.dart';
import '../../core/common_widget/logo_screen.dart';

class EntryPointScreen extends StatelessWidget {
  const EntryPointScreen({super.key});

  static const routeName = 'entryPoint';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // wind logo
            const LogoScreen(),
            // sign in button
            CustomOrangeButton(
              customWidh: width * 0.6,
              backgroundColor: MyColors.kPrimaryColor,
              textColor: MyColors.kSecondaryColor,
              text: S.of(context).SignIn,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthenticationScreenT(
                              pageType: MyRes.kSignIn,
                            )));
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            // sign up button
            CustomOrangeButton(
                customWidh: width * 0.6,
                textColor: MyColors.kPrimaryColor,
                text: S.of(context).SignUp,
                onTap: () {
                  Navigator.of(context).pushNamed(MyRes.kSignUpPage);
                }),
          ],
        ),
      ),
    );
  }
}
