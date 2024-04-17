import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';

Column buildbenchedPlayerContainer(
    {required String playerName,
    required String teamName,
    required BuildContext context}) {
  return Column(children: [
    Image.asset(
      teamName == "anonymTeam"
          ? "assets/greyKit.png"
          : "assets/kits/$teamName.png",
      width: ScreenUtils.getWidth(context) * 0.19,
      height: ScreenUtils.getWidth(context) * 0.19,
    ),
    Container(
      alignment: Alignment.center,
      width: ScreenUtils.getWidth(context) * 0.18,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black,
      ),
      child: AutoSizeText(
        maxLines: 1,
        overflow: TextOverflow.visible,
        maxFontSize: 13,
        minFontSize: 8,
        playerName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),
  ]);
}

Column buildPlayerContainer({
  required String playerName,
  required String playerPosition,
  required String teamName,
  required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(
        teamName == "anonymTeam"
            ? "assets/kits/anonymTeam.png"
            : "assets/kits/$teamName.png",
        width: ScreenUtils.getWidth(context) * 0.19,
        height: ScreenUtils.getWidth(context) * 0.19,
      ),
      Container(
        alignment: Alignment.center,
        width: ScreenUtils.getWidth(context) * 0.18,
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
          playerName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: ScreenUtils.getWidth(context) * 0.18,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10), bottomLeft: Radius.circular(7)),
          color: Colors.white,
        ),
        child: const AutoSizeText(
          maxLines: 1,
          overflow: TextOverflow.visible,
          maxFontSize: 15,
          minFontSize: 8,
          "",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      )
    ],
  );
}




String getTextToShow(List<ShowTeam> listOfFantasyPlayers,
    List<Player> allPlayers, Map<String, dynamic> myMap, String position) {
  String playerPos = myMap[position] ?? "";
  return listOfFantasyPlayers.any((element) =>
          getPlayerName(element.playerId!, allPlayers) == playerPos)
      ? playerPos
      : " No PLayer Found";
}
