import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/features/onbording%20screen/on_boarding_screen.dart';
import 'package:front/features/splash%20screen/widgets/animated_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.kWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: MyAnimationRippleScale(
              containerColor: MyColors.kSecondaryColor,
              fixedWidget: Image.asset(
                MyRes.kWindLogo,
                width: width * 0.6,
                fit: BoxFit.scaleDown,
              ),
              // onTap: () {
              //   Future.delayed(
              //       const Duration(
              //         milliseconds: 300,
              //       ),
              //       () => setState(() {
              //           }));
              // },
              // optionalWidgets: [
              //  // buildProgressIndicator(context),
              // ],
              onFinished: () {
                setState(() {
                  // buildProgressIndicator(context);
                  Future.delayed(const Duration(seconds: 1), () {
                    // Navigate to the onboarding screen
                    //  Navigator.of(context).Pysh(OnboardingScreen.routeName);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingScreen()));
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
