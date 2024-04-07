
import 'package:flutter/material.dart';
import 'package:front/features/entry%20point/entry_point.dart';
import 'package:front/features/langauge/lanaguge_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = 'onboarding';

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            },
            children:  const <Widget>[

              LanguageScreen(),
           EntryPointScreen(),

            ],
          ),

        ],
      ),
    );
  }
}
