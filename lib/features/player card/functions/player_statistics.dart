import 'package:flutter/material.dart';

import '../../../core/common_functions/extract_player_name.dart';
import '../../../core/common_widget/show_player_widget.dart';
import '../../fantasy/Model/player.dart';
import '../../fantasy/Model/show_team.dart';
import '../../fantasy/View/widgets/player_icon.dart';
import '../View/player_card.dart';

void navigateToPlayerCard(BuildContext context, List<Player> allPlayers,
    List<ShowTeam> listOfFantasyPlayers, Map<String, dynamic> myMap,
    Map<String, dynamic> myTshirtMap,String playerPostionName,String playerPostionName2) {
  Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => PlayerCard(
    // player: listOfFantasyPlayers.any((element) =>
    // getPlayerStatistic(element.id, allPlayers) ),
      player: getPlayerStatistic(list: listOfFantasyPlayers, players: allPlayers),
      teamName: getTshirtTeamToShow(
        nameOfPlayer: getTextToShow(listOfFantasyPlayers,
            allPlayers, myMap, playerPostionName),
        map: myTshirtMap,
      ),
      teamTshirt: getTshirtTeamToShow(
        nameOfPlayer: getTextToShow(listOfFantasyPlayers,
            allPlayers, myMap, playerPostionName),
        map: myTshirtMap,
      ),
      position: playerPostionName2,
      playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
          myMap, playerPostionName)),
  ),
  );
}