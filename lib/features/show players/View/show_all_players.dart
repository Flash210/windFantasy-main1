import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';

import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:front/features/show%20players/View/player_view_stat.dart';
import 'package:provider/provider.dart';

class ShowAllPlayers extends StatefulWidget {
  @override
  State<ShowAllPlayers> createState() => _ShowAllPlayersState();
}

class _ShowAllPlayersState extends State<ShowAllPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.1,
        title: const MyCustomText(
          text: 'All Players',
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: (value) {
                sl<PlayerProvider>().filterPlayersByName(value);
              },
              decoration: const InputDecoration(
                labelText: "Search Player Name",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Consumer<PlayerProvider>(
              builder: (context, playerProvider, _) {
                if (playerProvider.viewAllPlayers.isEmpty) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Show loading indicator
                } else {
                  return ListView.builder(
                    itemCount: playerProvider.viewAllPlayers.length,
                    //playerProvider.players.length,
                    itemBuilder: (context, index) {
                      final player = playerProvider.viewAllPlayers[index];
                      // final player = filteredList[index];

                      return ListTile(
                        title: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                focusColor: Colors.transparent,
                                onTap: () {
                                  navigateToPlayerStaticCard(context,
                                      teamTshirt: getTeamShirtName(
                                          teamName: hey(player: player).name),
                                      teamName: hey(player: player).name,
                                      player: player);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.person,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            size: 30),
                                        MyCustomText(text: player.name),
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: player.position ==
                                                        MyRes.kMidfilder
                                                    ? Colors.blue
                                                    : player.position ==
                                                            MyRes.kDefender
                                                        ? const Color(
                                                            0xFF4D4C7D)
                                                        : player.position ==
                                                                MyRes.kForward
                                                            ? const Color
                                                                .fromARGB(255,
                                                                138, 126, 21)
                                                            : Colors.red,
                                              ),
                                              child: MyCustomText(
                                                text: player.position,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                                height: 30,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 9, top: 2),
                                                  child: MyCustomText(
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          '  ${player.price}\$  '),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void navigateToPlayerStaticCard(BuildContext context,
    {required Player player,
    required String teamTshirt,
    required String teamName}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => PlayerViewStat(
              player: player,
              teamTshirt: teamTshirt,
              teamName: teamName,
            )),
  );
}

hey({required Player player}) {
  //sl<PlayerProvider>().fetchTeams();
  final List<Team> teams = sl<PlayerProvider>().teams;
  print(" Teams " + teams.length.toString());
  final teamName = teams.firstWhere(
    (team) => team.id == player?.teamId,
    orElse: () => Team(
      id: 0,
      name: 'Unknown',
    ),
  );

  return teamName;
}
