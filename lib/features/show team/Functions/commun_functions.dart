import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:get/get.dart';

int getPlayerId(List<Player> allPlayers, Map<String, dynamic> myMap) {
  return allPlayers
      .firstWhere(
        (player) => myMap.containsValue(player.name),
        orElse: () => Player.empty(),
      )
      .id;
}

String getPlayerName(List<Player> allPlayers, int id) {
  Player? matchingPlayer = allPlayers.firstWhereOrNull(
    (player) => player.id == id,
  );
  return matchingPlayer?.name ?? 'No Match';
}

// bool showIsCaptain(
//     {required List<Player> allPlayers,
//     required String playerPosition,
//     required Map<String, dynamic> myMapOfPlayersName,
//     required List<ShowTeam> listOfFantasyPlayers}) {
//   int playerId = allPlayers
//       .firstWhere(
//         (player) =>
//             myMapOfPlayersName[playerPosition] == extractLastName(player.name),
//         orElse: () => Player.empty(),
//       )
//       .id;

//   ShowTeam playerData = listOfFantasyPlayers
//       .firstWhere((element) => element.playerId == playerId);

//   return playerData.captain!.contains("34") ? true : false;
// }


bool  buildCaptainOrVice({ required bool isCaptain,required List<Player> allPlayers,
    required String playerPosition,
    required Map<String, dynamic> myMapOfPlayersName,
    required List<ShowTeam> listOfFantasyPlayers}){


       int playerId = allPlayers
      .firstWhere(
        (player) =>
            myMapOfPlayersName[playerPosition] == extractLastName(player.name),
        orElse: () => Player.empty(),
      )
      .id;

  ShowTeam playerData = listOfFantasyPlayers
      .firstWhere((element) => element.playerId == playerId);

  return  isCaptain ?   playerData.captain!.contains("34") ? true : false : 
playerData.viceCaptain!.contains("34") ? true : false;


}