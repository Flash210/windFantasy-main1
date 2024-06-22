import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:front/features/fantasy/Controller/team_edit_provider.dart';
import 'package:front/features/fantasy/View/widgets/bottom_sheet_widget.dart';
import 'package:provider/provider.dart';

// ! build player icon and name
buildPlayer(
    {required String title,
    required String position,
    required BuildContext context,
    required int playersSelected,
    required String teamName}) {
  return Column(
    children: [
      GestureDetector(
          onDoubleTap: () {
            String ch = sl<TeamEditProvider>().teamName;
            int amount = sl<PlayerProvider>().amount;
            // ! remove player from screen
            Provider.of<PlayerProvider>(context, listen: false)
                .deleteFromSelectedPlayerToMap();
            //! remove team from map constraint
            sl<TeamEditProvider>().checkMaxTeam(teamName: ch, longPress: true);
            sl<TeamEditProvider>().resetcheckMaxTeam();
            //! return the previous amount to user
            amount < 100
                ? sl<PlayerProvider>().amountSubstraction(
                    value: sl<TeamEditProvider>().playerPrice, longPress: true)
                : null;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const MyCustomText(text: 'Player Deleted :)'),
                backgroundColor: Colors.red,
              ),
            );
          },
          onTap: () {
            showListOfPlayers222(context: context, positionPlayer: position);
          },
          child: buildPlayerContainer(
              playerName: extractLastName(title),
              playerPosition: position,
              teamName: teamName,
              context: context)),
    ],
  );
}

buildBenchPlayer(
    {required String title,
    required String position,
    required BuildContext context,
    required int playersSelected,
    required String teamName}) {
  return Column(
    children: [
      GestureDetector(
          onDoubleTap: () {
            String ch = sl<TeamEditProvider>().teamName;
            int amount = sl<PlayerProvider>().amount;
            // ! remove player from screen
            Provider.of<PlayerProvider>(context, listen: false)
                .deleteFromSelectedPlayerToMap();
            //! remove team from map constraint
            sl<TeamEditProvider>().checkMaxTeam(teamName: ch, longPress: true);
            sl<TeamEditProvider>().resetcheckMaxTeam();
            //! return the previous amount to user
            amount < 100
                ? sl<PlayerProvider>().amountSubstraction(
                    value: sl<TeamEditProvider>().playerPrice, longPress: true)
                : null;
          },
          onTap: () {
            showListOfPlayers222(context: context, positionPlayer: position);
          },
          child: buildbenchedPlayerContainer(
              playerName: extractLastName(title),
              teamName: teamName,
              context: context))
    ],
  );
}

Widget buildPlayerPositionInTheStatdium(
  String positionPrefix,
  Map<String, Player> selectedPlayersMap,
  Map<String, int> playerPositions,
  BuildContext context,
  playersSelected,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      playerPositions[positionPrefix]!,
      (index) {
        // ! positionPrefix = def or st or bench or mid
        //! For example, if positionPrefix is "def" and index is 0, then position = "def" + (0 + 1).toString()
        //results in position = "def1"
        final position = positionPrefix + (index + 1).toString();

        final player = selectedPlayersMap[position];
        final playerName = player?.name ?? "";
        final List<Team> teams = sl<PlayerProvider>().teams;
        final teamName = teams.firstWhere(
          (team) => team.id == player?.teamId,
          orElse: () => Team(
            id: 0,
            name: 'Unknown',
          ),
        );

        return buildPlayer(
          title: playerName,
          position: position,
          context: context,
          playersSelected: playersSelected,
          teamName: getTeamShirtName(teamName: teamName.name!),
        );
      },
    ),
  );
}

Widget buildBenchedPlayerPositionInSatduim(
  String positionPrefix,
  Map<String, Player> selectedPlayersMap,
  Map<String, int> playerPositions,
  BuildContext context,
  int playersSelected,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(
      playerPositions[positionPrefix]!,
      (index) {
        // ! positionPrefix = def or st or bench or mid
        //! For example, if positionPrefix is "def" and index is 0, then position = "def" + (0 + 1).toString()
        //results in position = "def1"
        final position = positionPrefix + (index + 1).toString();

        final player = selectedPlayersMap[position];
        final playerName = player?.name ?? "";
        final List<Team> teams = sl<PlayerProvider>().teams;
        final teamName = teams.firstWhere(
          (team) => team.id == player?.teamId,
          orElse: () => Team(
            id: 0,
            name: 'Unknown',
          ),
        );
        return buildBenchPlayer(
          title: playerName,
          position: position,
          context: context,
          playersSelected: playersSelected,
          teamName: getTeamShirtName(teamName: teamName.name!),
        );
      },
    ),
  );
}
