import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';

import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';

import '../../auth/Model/user_model.dart';
import '../model/game_week.dart';

class GameWeekDashboard extends StatefulWidget {
  GameWeekDashboard({super.key});

  @override
  State<GameWeekDashboard> createState() => _GameWeekDashboardState();
}

class _GameWeekDashboardState extends State<GameWeekDashboard> {
  @override
  void initState() {
    initAh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MySizedBox(height: ScreenUtils.getHeight(context) * 0.19),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.kSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MyCustomText(
                  text: " Live",
                  style: const TextStyle(fontSize: 13, color: Colors.white)),
            ),
            MySizedBox(height: ScreenUtils.getHeight(context) * 0.02),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 35, right: 35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  MyCustomText(
                    text: "0",
                    color: Colors.black,
                    style: const TextStyle(fontSize: 70),
                  ),
                  const MyCustomText(
                    text: "Points ",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            MySizedBox(
              height: ScreenUtils.getHeight(context) * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    await sl<AuthProvider>().getUserInfo().then((value) =>
                        value!.success == true
                            ? Navigator.pushNamed(context, MyRes.kFantasy)
                            : const CircularProgressIndicator());
                  },
                  child: const MyCustomText(
                    text: "Pick A Team",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const MyCustomText(text: "Transfert"),
              ],
            ),
            MySizedBox(
              height: ScreenUtils.getHeight(context) * 0.09,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyCustomText(text: "Transfert"),
                MyCustomText(text: "Fixtures"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  initAh() async {
    await sl<ShowTeamProvider>().getGameWeekAndPoints();
    await sl<AuthProvider>().getUserInfo();
    sl<ShowTeamProvider>().gameWeek;
    print(sl<ShowTeamProvider>().gameWeek[0].gameWeek);
  }
}
