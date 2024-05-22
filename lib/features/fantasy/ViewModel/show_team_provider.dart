import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/Model/update_team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../gameweek dashbord/model/game_week.dart';

class ShowTeamProvider extends ChangeNotifier {
  List<ShowTeam> showTeam = [];

  Future<List<ShowTeam>> fetchTeams() async {
    final String? token = await sl<TokenManager>().getToken();
    final response = await http.get(
      Uri.parse("${AppConfig.kUserBaseUrl}getUserTeam/38"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    final jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final data = jsonData['data'] as List<dynamic>;
        final showTeamList = data.map((teamData) {
          return ShowTeam.fromJson(teamData);
        }).toList();

        // Update your showTeam list with the new data
        showTeam = showTeamList;

        // Notify listeners to update UI
        notifyListeners();

        return showTeam;
      } catch (e) {
        print("Error processing JSON data: $e");
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
    //notifyListeners();
    return player.name;
  }

  Map<String, String> savePlayerPostion = {};
  void fillSavePlayerListPostion(
      {required String playerPosition, required String playerName}) {
    savePlayerPostion[playerPosition] = playerName;

    notifyListeners();
  }

  Map<String, String> saveTeamShirt = {};

  void saveTeamShirtF({
    required String playerName,
    required String teamShirt,
  }) {
    saveTeamShirt[playerName] = teamShirt;

    notifyListeners();
  }

  List<GameWeek> gameWeek = []; // Initialize as an empty list

  Future<List<GameWeek>> getGameWeekAndPoints() async {
    Logger logger = Logger();

    final String? token = await sl<TokenManager>().getToken();

    var response = await http.get(
      Uri.parse("${AppConfig.kUserPlayerBaseUrl}getAllUserPlay"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(response.body);
        final data = jsonData['data'] as List<dynamic>;

        List<GameWeek> showGameWeek = data
            .map((gameWeekData) => GameWeek.fromJson(gameWeekData))
            .toList();
        gameWeek = showGameWeek;

        logger.i("GameWeek: Good ${showGameWeek[0].gameWeek}");

        notifyListeners();
        return showGameWeek;
      } catch (e) {
        logger.e(
            "Error processing JSON data: $e + ${response.body} + ${response.statusCode}");
        return [];
      }
    } else {
      logger.e(" internet Error processing JSON data: ${response.body}");
      return [];
    }
  }

  void setString(String ch1, String ch2) {
    ch1 = ch2;
    notifyListeners();
  }

  Future<bool> updateUserTeam(List<UpdateTeam> updates) async {
    final String? token = await sl<TokenManager>().getToken();

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.patch(
        "${AppConfig.kUserBaseUrl}updateUserTeam",
        data: updates
            .map((update) => {
                  "id": update.id,
                  "playerId": update.playerId,
                  "userId": update.userId,
                  "PlayingInGameweeks": update.playingInGameweeks,
                  "captain": update.captain,
                  "viceCaptain": update.viceCaptain
                })
            .toList(),
      );

      if (response.statusCode == 200) {
        notifyListeners();
        print("Response: ${response.data}");
        return true;
      } else {
        print("Error updating user team: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  List<String> listOfSwitch = [];

  addToSwitchList({required String name}) {
    listOfSwitch.add(name);

    notifyListeners();
  }

  resetSwitchList() {
    listOfSwitch.clear();
    notifyListeners();
  }
}
