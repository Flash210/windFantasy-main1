import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';

import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:front/features/gameweek%20dashbord/model/game_week.dart';
import 'package:front/features/show%20players/View/show_all_players.dart';
import 'package:front/features/show%20players/View/show_all_teams.dart';

class GameWeekDashboard extends StatefulWidget {
  const GameWeekDashboard({super.key});

  @override
  State<GameWeekDashboard> createState() => _GameWeekDashboardState();
}

class _GameWeekDashboardState extends State<GameWeekDashboard> {
  List<GameWeek> getGameWeek = [];

  @override
  void initState() {
    //initAh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: FutureBuilder(
            future: initAh(),
            builder: (context, snapshot) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MySizedBox(height: ScreenUtils.getHeight(context) * 0.19),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const MyCustomText(
                        text: "GameWeek 35 Live ",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
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
                          text: snapshot.data != null
                              ? getGameWeek[0].points.toString()
                              : "0",
                          color: Colors.black,
                          style: TextStyle(fontSize: 70),
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
                  buildFields(
                      fieldName: "Check Your Team",
                      onPressed: () async {
                        await sl<AuthProvider>().getUserInfo().then((value) =>
                            value!.success
                                ? Navigator.pushNamed(context, MyRes.kFantasy)
                                : const CircularProgressIndicator());
                      }),
                  MySizedBox(
                    height: ScreenUtils.getHeight(context) * 0.09,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildFields(
                          fieldName: "Players",
                          onPressed: () {
                            sl<PlayerProvider>().fillViewAllPlayers();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllPlayers()),
                            );
                          }),
                      buildFields(
                          fieldName: "Teams",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllTeams()),
                            );
                          }),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  initAh() async {
    getGameWeek = await sl<ShowTeamProvider>().getGameWeekAndPoints();
    await sl<AuthProvider>().getUserInfo();
    sl<ShowTeamProvider>().gameWeek;
    sl<PlayerProvider>().fetchPlayerss();
    print(sl<ShowTeamProvider>().gameWeek[0].gameWeek);
  }
}

buildFields({required String fieldName, Function()? onPressed}) {
  return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: MyColors.kWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.kSecondaryColor),
      ),
      child: IconButton(
        icon: MyCustomText(
          text: fieldName,
          style: const TextStyle(color: MyColors.kSecondaryColor),
        ),
        onPressed: onPressed,
      ));
}
