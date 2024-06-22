import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/Model/user_model.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';

import 'package:front/features/fantasy/Controller/show_team_provider.dart';
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
  late Future<UserModel?> _userModel;

  @override
  void initState() {
    initAh();
    _userModel = sl<AuthProvider>().getUserInfo();
    super.initState();
  }

  Future<void> initAh() async {
    // Initialization logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: FutureBuilder(
          future: initAh(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/sezz.jpg', // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: MyColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const MyCustomText(
                        text: "Season Finished",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 35),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          FutureBuilder<UserModel?>(
                            future: _userModel,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData) {
                                return Text('No data available');
                              } else {
                                final UserModel user = snapshot.data!;
                                final UserData userData = user.data;
                                return MyCustomText(
                                  text: userData.points.toString(),
                                  color: Colors.black,
                                  style: TextStyle(fontSize: 70),
                                );
                              }
                            },
                          ),
                          MyCustomText(
                            text: "Points",
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    buildFields(
                      fieldName: "Check Your Team",
                      onPressed: () async {
                        await sl<AuthProvider>().getUserInfo().then((value) =>
                            value!.success
                                ? Navigator.pushNamed(context, MyRes.kFantasy)
                                : const CircularProgressIndicator());
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
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
                                builder: (context) => ShowAllPlayers(),
                              ),
                            );
                          },
                        ),
                        buildFields(
                          fieldName: "Teams",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowAllTeams(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

initAh() async {
  //getGameWeek = await sl<ShowTeamProvider>().getGameWeekAndPoints();
  await sl<AuthProvider>().getUserInfo();
  sl<ShowTeamProvider>().gameWeek;
  sl<PlayerProvider>().fetchPlayerss();
  print(sl<ShowTeamProvider>().gameWeek[0].gameWeek);
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
