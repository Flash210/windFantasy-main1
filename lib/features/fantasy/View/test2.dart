import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/test.dart';

buildShowFantasyTeam(
    {required BuildContext context,
    required List<Player> allPlayers,
    required List<ShowTeam> listOfFantasyPlayers}) {
  return Column(
    children: [
      MyCustomText(text: getPlayerName(showTeams[0].playerId!)),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyCustomText(text: getPlayerName(showTeams[2].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[3].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[4].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[5].playerId!)),
        ],
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyCustomText(text: getPlayerName(showTeams[6].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[7].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[8].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[9].playerId!)),
        ],
      ),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyCustomText(text: getPlayerName(showTeams[10].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[11].playerId!)),
        ],
      ),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyCustomText(text: getPlayerName(showTeams[10].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[11].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[12].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[13].playerId!)),
          MyCustomText(text: getPlayerName(showTeams[14].playerId!)),
        ],
      )
    ],
  );
}

String extractLastName(String fullName) {
  List<String> nameParts = fullName.split('.');
  List<String> nameParts2 = nameParts.last.split(' ');

  if (nameParts2.length > 1) {
    return nameParts2.last;
  }

  return nameParts.last;
}

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
  return extractLastName(player.name);
}
