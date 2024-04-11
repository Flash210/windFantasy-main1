import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ShowTeamProvider extends ChangeNotifier {
  Logger logger = Logger();

  List<ShowTeam> showTeam = [];

  Future<List<ShowTeam>> fetchTeams() async {
    final String? token = await sl<TokenManager>().getToken();
    final response = await http.get(
       
        Uri.parse("${AppConfig.kUserBaseUrl}getUserTeam/32"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });
    final jsonData = json.decode(response.body);
    // logger.i(jsonData);

    if (response.statusCode == 200) {
      try {
        final data = jsonData['data'] as List<dynamic>;
        showTeam = data.map((teamData) => ShowTeam.fromJson(teamData)).toList();
        print(showTeam.length);
        notifyListeners();
        return showTeam;
      } catch (e) {
        print("Error processing JSON data: $e");
        // Handle the error as needed, such as logging or displaying an error message to the user
        return [];
      }
    } else {
      print("Error processing JSON data: $jsonData");
    }

    return [];
  }

  List<ShowTeam> showFantasyTeamList = [];

  final players = sl<PlayerProvider>().players;

  String getPlayerName(int playerID) {
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
    print("Player Name ${player.name}");
    //notifyListeners();
    return player.name;
  }

  Map<String, String> savePlayerPostion = {};
  void FillsavePlayerListPostion(
      {required String playerPosition, required String playerName}) {
    savePlayerPostion[playerPosition] = playerName;
    print(playerPosition + playerName);
    print(savePlayerPostion.length);
    notifyListeners();
  }
}
