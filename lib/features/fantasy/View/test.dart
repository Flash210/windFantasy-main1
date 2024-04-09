import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:provider/provider.dart';

class Testt extends StatefulWidget {
  const Testt({Key? key}) : super(key: key);

  @override
  State<Testt> createState() => _TesttState();
}

List<Player> players = [];
List<ShowTeam> showTeams = [];

class _TesttState extends State<Testt> {
  @override
  void initState() {
    super.initState();
    setPlayerList();
  }

  @override
  Widget build(BuildContext context) {
    print("kkk" + showTeams.length.toString());
    print("mmm is " + players.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Team"),
      ),
      body: ListView.builder(
        itemCount: showTeams.length,
        itemBuilder: (context, index) {
          print(getPlayerName(showTeams[index].playerId!));
          return ListTile(
            title: Text(getPlayerName(showTeams[index].playerId!)),
            //  subtitle: Text(showFantasyTeam[index].playerId!.toString()),
          );
        },
      ),
    );
  }

  // playersList() async {
  //   return players = await sl<PlayerProvider>().fetchPlayerss();
  // }

  String getPlayerName(int playerID) {
    final player = players.firstWhere((element) => element.id == playerID,
        orElse: () => Player(
            id: 0,
            name: "name",
            position: "position",
            price: 0,
            totalMatchesPlayed: 0,
            totalPoints: 0,
            totalGoals: 0,
            totalAssists: 0,
            totalRedCard: 0,
            totalYellowCard: 0,
            totalOwnGoals: 0,
            totalCleanSheet: 0,
            totalManOfTheMatch: 0,
            totalMissedPenalties: 0,
            createdAt: "createdAt",
            updatedAt: "updatedAt",
            teamId: 0));
    return player.name;
  }

  setPlayerList() async {
    players = await sl<PlayerProvider>().fetchPlayerss();
    showTeams = await sl<ShowTeamProvider>().fetchTeams();
  }
}
