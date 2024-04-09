import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:provider/provider.dart';

class Testt extends StatefulWidget {
  const Testt({Key? key}) : super(key: key);

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Team"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final l = sl<ShowTeamProvider>().fetchTeams();
                  print(l);
                },
                child: Text("CLick Here ")),
            // Consumer<ShowTeamProvider>(
            //   builder: (context, value, _) => ListView.builder(
            //     itemCount: value.showTeam.length,
            //     itemBuilder: (context, index) {
            //       print(value.getPlayerName(2));
            //       return ListTile(
            //         title: Text("mmm"),
            //         //  subtitle: Text(showFantasyTeam[index].playerId!.toString()),
            //       );
            //     },
            //   ),
            // ),
          ],
        ));
  }

  // playersList() async {
  //   return players = await sl<PlayerProvider>().fetchPlayerss();
  // }

  // String getPlayerName(int playerID) {
  //   final player = players.firstWhere((element) => element.id == playerID,
  //       orElse: () => Player(
  //           id: 0,
  //           name: "name",
  //           position: "position",
  //           price: 0,
  //           totalMatchesPlayed: 0,
  //           totalPoints: 0,
  //           totalGoals: 0,
  //           totalAssists: 0,
  //           totalRedCard: 0,
  //           totalYellowCard: 0,
  //           totalOwnGoals: 0,
  //           totalCleanSheet: 0,
  //           totalManOfTheMatch: 0,
  //           totalMissedPenalties: 0,
  //           createdAt: "createdAt",
  //           updatedAt: "updatedAt",
  //           teamId: 0));
  //   return player.name;
  // }
}
