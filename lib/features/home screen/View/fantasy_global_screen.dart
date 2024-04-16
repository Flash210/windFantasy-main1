import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/ital.png",
          fit: BoxFit.fill,
        ),
        // SingleChildScrollView(child: body),
        Positioned(
          top: 150,
          left: 30,
          child: GestureDetector(
            onTap: () => sl<AuthProvider>().getUserInfo().then((value) =>
            value!.success ? Navigator.pushNamed(context, MyRes.kFantasy)
            : CircularProgressIndicator()
            ),
            child: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const MyCustomText(
                text: "Pick A Team",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
