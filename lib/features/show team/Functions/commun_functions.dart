import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/Model/update_team.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
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

bool buildCaptainOrVice(
    {required bool isCaptain,
    required List<Player> allPlayers,
    required String playerPosition,
    required Map<String, dynamic> myMapOfPlayersName,
    required List<ShowTeam> listOfFantasyPlayers}) {
  int playerId = allPlayers
      .firstWhere(
        (player) =>
            myMapOfPlayersName[playerPosition] == extractLastName(player.name),
        orElse: () => Player.empty(),
      )
      .id;

  ShowTeam playerData = listOfFantasyPlayers
      .firstWhere((element) => element.playerId == playerId);

  return isCaptain
      ? playerData.captain!.contains("36")
          ? true
          : false
      : playerData.viceCaptain!.contains("36")
          ? true
          : false;
}

switchPlayersInFanatsyTeam() async {
  Map<String, dynamic> retrievedMap = {};

  retrievedMap = await sl<TokenManager>().getMap();

  List<String> listOfSwitch = sl<ShowTeamProvider>().listOfSwitch;
  retrievedMap[listOfSwitch[0]] = listOfSwitch[3];
  retrievedMap[listOfSwitch[2]] = listOfSwitch[1];

  sl<ShowTeamProvider>().resetSwitchList();
  print("retrievedMap: $retrievedMap");

  // sl<TokenManager>().savePlayerPositionToMap(map: retrievedMap);
}

setPlayerInOrOutGameWeek(
    {required List<ShowTeam> listOfFantasyPlayers,
    required int numberOfPlayerInList,
    required bool inOrOut}) async {
  bool captainValue =
      listOfFantasyPlayers[numberOfPlayerInList].captain!.contains("36");
  bool viceCaptainValue =
      listOfFantasyPlayers[numberOfPlayerInList].viceCaptain!.contains("36");

  var x = UpdateTeam(
    id: listOfFantasyPlayers[numberOfPlayerInList].id!,
    playerId: listOfFantasyPlayers[numberOfPlayerInList].playerId!,
    userId: listOfFantasyPlayers[numberOfPlayerInList].userId!,
    playingInGameweeks: inOrOut ? "36" : "",
    captain: captainValue ? "36" : "",
    viceCaptain: viceCaptainValue ? "36" : "",
  );
  List<UpdateTeam> updateTeam = [x];
  await sl<ShowTeamProvider>().updateUserTeam(updateTeam);
}

addPlayerToSwitchList({
  required List<ShowTeam> listOfFantasyPlayers,
  required List<Player> allPlayers,
  required Map<String, dynamic> myMapOfPlayersName,
  required String playerPosition,
}) {
  sl<ShowTeamProvider>().addToSwitchList(name: playerPosition);

  sl<ShowTeamProvider>().addToSwitchList(
      name: getTextToShow(listOfFantasyPlayers, allPlayers, myMapOfPlayersName,
          playerPosition));
}

showAllPlayersDetails({required List<Player> allPlayers}) async {
  await sl<ShowTeamProvider>().fetchTeams();
  sl<ShowTeamProvider>().showTeam.forEach(
    (element) {
      print(
          " | ${getPlayerName(allPlayers, element.playerId!)} | => Playing in  ${element.playingInGameweeks} + Captain ${element.captain} + ViceCaptain ${element.viceCaptain}  + ${element.playerId} ");
    },
  );
}





