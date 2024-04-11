import 'dart:convert';

import 'package:flutter/material.dart';
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

  //List<ShowTeam> get showTeam => _showTeam;

  Future<List<ShowTeam>> fetchTeams() async {
    final String? token = await sl<TokenManager>().getToken();
    final response = await http.get(
        Uri.parse("http://192.168.196.55:3001/api/users/getUserTeam/32"),
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
      // Handle the error as needed, such as logging or displaying an error message to the user
    }

    return [];
  }

  // List<ShowTeam> showFantasyTeam = [];
  // Future<List<ShowTeam>> fetchAndSetFantasyTeam() async {
  //   try {
  //     final String? token = await sl<TokenManager>().getToken();
  //     final response = await http.get(
  //       Uri.parse("${AppConfig.kUserBaseUrl}getUserTeam/32"),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json'
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);

  //       final fanatsyData = jsonData['data'] as List<dynamic>;
  //       showFantasyTeam =
  //           fanatsyData.map((teamData) => ShowTeam.fromJson(teamData)).toList();

  //       print(showFantasyTeam.length);
  //       notifyListeners();
  //       print("Fantasy Showed Successfully");

  //       return showFantasyTeam;
  //     } else {
  //       print('Failed to load fantasy team data: ${response.statusCode}');
  //       throw Exception('Failed to load fantasy team data');
  //     }
  //   } catch (e) {
  //     print('Error fetching fantasy team data: $e');
  //     throw Exception('Error fetching fantasy team data');
  //   }
  // }

  // List<ShowTeam> showFantasyTeam = [];

  // Future<List<ShowTeam>> showFantasyTeamListF() async {
  //   final String? token = await sl<TokenManager>().getToken();
  //   final response = await http.get(
  //     Uri.parse(AppConfig.kUserBaseUrl + "getUserTeam/32"),
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     },
  //   );
  //   final jsonData = json.decode(response.body);
  //   if (jsonData['success']) {
  //     print("Fanatsy Showed Successfully");
  //     final fanatsyData = jsonData['data'] as List<dynamic>;
  //     showFantasyTeam =
  //         fanatsyData.map((teamData) => ShowTeam.fromJson(teamData)).toList();
  //     logger.i(showFantasyTeam.length);
  //     print(showFantasyTeam.length);
  //     notifyListeners();

  //     return showFantasyTeam;
  //   } else {
  //     print("Fanatsy Show Failed");
  //   }

  //   return [];
  // }

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
}
