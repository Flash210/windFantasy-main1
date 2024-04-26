import 'package:flutter/material.dart';
import 'package:front/core/common_widget/show_player_widget.dart';

GestureDetector buildPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    required Map<String, dynamic> myTshirtMap,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    required BuildContext context}) {
  return GestureDetector(
    onDoubleTap: onDoubleTap,
    onTap: onTap,
    child: isItBenched == "No"
        ? buildPlayerContainer(
          
          
            playerName: playerName,
            playerPosition: playerPosition,
            teamName:
                getTshirtTeamToShow(map: myTshirtMap, nameOfPlayer: playerName),
            context: context)
        : buildbenchedPlayerContainer(
            playerName: playerName,
            teamName:
                getTshirtTeamToShow(map: myTshirtMap, nameOfPlayer: playerName),
            context: context),
  );
}

Column buildBenchedPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    required Map<String, dynamic> myTshirtMap,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildPlayerIcon(
          myTshirtMap: myTshirtMap,
          playerName: playerName,
          playerPosition: playerPosition,
          onDoubleTap: onDoubleTap,
          onTap: onTap,
          isItBenched: isItBenched,
          context: context)
    ],
  );
}

String getTshirtTeamToShow(
    {required String nameOfPlayer, required Map<String, dynamic> map}) {
  bool exist = map.containsKey(nameOfPlayer);
  // print("nameOfPlayer: " +
  //     nameOfPlayer +
  //     " nameOfPlayer" +
  //     map.containsKey(nameOfPlayer).toString());

  // print(map[nameOfPlayer].toString());

  return exist ? map[nameOfPlayer] : "anonymTeam";
}
