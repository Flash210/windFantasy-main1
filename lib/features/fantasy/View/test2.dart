import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/player_icon.dart';
import 'package:front/features/fantasy/functions/edit_team_functions.dart';

buildShowFantasyTeam(
    {required BuildContext context,
    required List<Player> allPlayers,
    required List<ShowTeam> listOfFantasyPlayers,
    required Map<String, dynamic> myMap}) {
  String gardien1 = myMap[
      "Gardien1"]; // Get value from myMap, default to empty string if null
  String textToShow = listOfFantasyPlayers.any(
          (element) => getPlayerName(element.playerId!, allPlayers) == gardien1)
      ? gardien1
      : " dd";

  return Column(
    children: [
      // buildPlayerIcon(
      //     playerName: getTextToShow(
      //         listOfFantasyPlayers, allPlayers, myMap, "Gardien1"),
      //     playerPosition: "Gardien1"),
      SizedBox(height: 15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur1")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur2")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur3")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur4")),
      ]),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu1")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu2")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu3")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu4")),
      ]),
      const SizedBox(height: 30),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Attaquant1")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Attaquant2")),
      ]),
      const SizedBox(height: 30),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "bench1")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "bench2")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "bench3")),
        MyCustomText(
            text: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "bench4")),
      ]),
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
