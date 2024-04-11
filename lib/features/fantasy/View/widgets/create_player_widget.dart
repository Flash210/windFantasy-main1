import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';
import 'package:front/features/fantasy/View/widgets/bottom_sheet_widget.dart';
import 'package:front/features/fantasy/functions/bottom_sheet_features.dart';
import 'package:provider/provider.dart';

// ! build player icon and name
buildPlayer(
    {required String title,
    required String position,
    required BuildContext context,
    required int playersSelected}) {
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
        child: Image.asset(
          "assets/whiteKit.png",
          width: 40,
          height: 40,
        ),
      ),
      Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(7)),
              color: Colors.black,
            ),
            child: AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.visible,
              maxFontSize: 13,
              minFontSize: 8,
              getOnlyPlayerName(playerName: title),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(7)),
              color: Colors.white,
            ),
            child: AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.visible,
              maxFontSize: 15,
              minFontSize: 8,
              position,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    ],
  );
}

buildBenchPlayer(
    {required String title,
    required String position,
    required BuildContext context,
    required int playersSelected}) {
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
        child: Image.asset(
          "assets/greyKit.png",
          width: 35,
          height: 40,
        ),
      ),
      AutoSizeText(
        getOnlyPlayerName(playerName: title),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 8,
        ),
        maxLines: 1,
        overflow: TextOverflow.clip,
      )
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
        return buildPlayer(
          title: playerName,
          position: position,
          context: context,
          playersSelected: playersSelected,
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
        return buildBenchPlayer(
            title: playerName,
            position: position,
            context: context,
            playersSelected: playersSelected);
      },
    ),
  );
}
