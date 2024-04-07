import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        MyRes.kStandingsBackground,
        fit: BoxFit.contain,
      ),
      Column(
        // profile screen
        children: [
          const SizedBox(
            height: 100,
          ),

          const Text('Stat Screen'),
          ElevatedButton(
              onPressed: () {
                sl<TokenManager>().clearToken();
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRes.kSignIn, (route) => false);
              },
              child: const Text('Log Out'))

          // add more widgets here
        ],
      ),
    ]));
  }
}
