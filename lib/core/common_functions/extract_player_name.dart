import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';

String extractLastName(String fullName) {
  List<String> nameParts = fullName.split('.');
  List<String> nameParts2 = nameParts.last.split(' ');

  if (nameParts2.length > 1) {
    return nameParts2.last;
  }

  return nameParts.last;
}

String getPlayerName(int playerID, List<Player> players) {
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

//!......
Player getPlayerStatistic(
    {required List<ShowTeam> list, required List<Player> players}) {


ShowTeam playerShowed = list.firstWhere((element) => element.id != null);
  final player = players.firstWhere((element) => element.id == playerShowed.id,
      orElse: () => Player.empty());
  return player;
}

String getTeamShirtName({required String teamName}) {
  switch (teamName) {
    case "AS Roma":
      return "roma";
    case "Atalanta":
      return "atalanta";
    case "Bologna":
      return "bologna";
    case "Cagliari":
      return "cagliari";
    case "Empoli":
      return "empoli";
    case "Fiorentina":
      return "fiorentina";
    case "Frosinone":
      return "frosinone";
    case "Genoa":
      return "genoa";
    case "Verona":
      return "verona";
    case "Inter":
      return "inter";
    case "Juventus":
      return "juventus";
    case "Lazio":
      return "lazio";
    case "Lecce":
      return "lecce";
    case "AC Milan":
      return "milan";
    case "Monza":
      return "monza";
    case "Napoli":
      return "napoli";
    case "Salernitana":
      return "salernitana";
    case "Sassuolo":
      return "sassuolo";
    case "Torino":
      return "torino";
    case "Udinese":
      return "udinese";
    default:
      return "anonymTeam";
  }
}

String getTeamShirtNameReversed({required String teamName}) {
  switch (teamName) {
    case "roma":
      return "AS Roma";
    case "atalanta":
      return "Atalanta";
    case "bologna":
      return "Bologna";
    case "cagliari":
      return "Cagliari";
    case "empoli":
      return "Empoli";
    case "fiorentina":
      return "Fiorentina";
    case "frosinone":
      return "Frosinone";
    case "genoa":
      return "Genoa";
    case "verona":
      return "Verona";
    case "inter":
      return "Inter";
    case "juventus":
      return "Juventus";
    case "lazio":
      return "Lazio";
    case "lecce":
      return "Lecce";
    case "milan":
      return "AC Milan";
    case "monza":
      return "Monza";
    case "napoli":
      return "Napoli";
    case "salernitana":
      return "Salernitana";
    case "sassuolo":
      return "Sassuolo";
    case "torino":
      return "Torino";
    case "udinese":
      return "Udinese";
    default:
      return "anonymTeam";
  }
}
