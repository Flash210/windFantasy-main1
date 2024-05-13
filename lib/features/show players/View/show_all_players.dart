import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';

import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/show%20players/View/player_view_stat.dart';
import 'package:provider/provider.dart';

class ShowAllPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Players'),
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, _) {
          if (playerProvider.players.isEmpty) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading indicator
          } else {
            return ListView.builder(
              itemCount: playerProvider.players.length,
              itemBuilder: (context, index) {
                final player = playerProvider.players[index];
                return ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          focusColor: Colors.transparent,
                          onTap: () {
                            navigateToPlayerStaticCard(context,
                                teamTshirt: getTeamShirtName(teamName: hey(player: player).name),
                                teamName:hey(player: player).name,
                                player: player);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.person,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 30),
                                MyCustomText(text: player.name),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: player.position ==
                                                MyRes.kMidfilder
                                            ? Colors.blue
                                            : player.position == MyRes.kDefender
                                                ? Colors.green
                                                : player.position ==
                                                        MyRes.kForward
                                                    ? const Color.fromARGB(
                                                        255, 138, 126, 21)
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
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 9, top: 2),
                                          child: MyCustomText(
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                              text: '  ${player.price}\$  '),
                                        )),
                                  ],
                                )
                              ],
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
    );
  }
}

void navigateToPlayerStaticCard(BuildContext context,
    {required Player player, required String teamTshirt,required String teamName}) {
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
