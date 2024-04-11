import 'package:front/features/fantasy/Model/player.dart';

String extractLastName(String fullName) {
  List<String> nameParts = fullName.split('.');
  List<String> nameParts2 = nameParts.last.split(' ');

  if (nameParts2.length > 1) {
    return nameParts2.last;
  }

  return nameParts.last;
}

String getPlayerName(int playerID,List<Player> players) {
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