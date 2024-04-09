import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerProvider extends ChangeNotifier {
  List<Player> _listForFilter = [];

  List<Player> get listForFilter => _listForFilter;

  set listForFilter(List<Player> value) {
    _listForFilter = value;
    // print("aaaaaaaaaa${value.map((e) => e.price)}");
    // print("aaaaaaaaaa2${value.map((e) => e.position)}");

    // print("aaaaaaaaaa3${value.map((e) => e.teamId)}");
    notifyListeners();
  }

  //List<Player> get players => _players;

// ! This method fetches all the players from the server

  List<Player> playerss = [];
  Future<List<Player>> fetchPlayerss() async {
    final String? token = await sl<TokenManager>().getToken();

    final response = await http.get(
        Uri.parse(AppConfig.kPlayerBaseUrl + AppConfig.kGetAllPlayers),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });
    final jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final data = jsonData['data'] as List<dynamic>;
        playerss = data.map((teamData) => Player.fromJson(teamData)).toList();
        print(playerss.length);
        notifyListeners();
        return playerss;
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

  // List<Player> playerss = [];

  // Future<List<Player>> fetchPlayerss() async {
  //   final response = await http
  //       .get(Uri.parse(AppConfig.kPlayerBaseUrl + AppConfig.kGetAllPlayers));
  //   final jsonData = json.decode(response.body);
  //   // logger.i(jsonData);

  //   if (jsonData['success']) {
  //     //logger.i(jsonData['data']);
  //     final playersData = jsonData['data'] as List<dynamic>;
  //     playerss =
  //         playersData.map((playerData) => Player.fromJson(playerData)).toList();
  //     print("Players provider" + playerss.length.toString());
  //     notifyListeners();
  //     return playerss;
  //   }
  //   print("Players provider" + playerss.length.toString());

  //   return [];
  // }

// ! This method fetches all  Teams from the server

  List<Team> _teams = [];

  List<Team> get teams => _teams;

  Future<List<Team>> fetchTeams() async {
    final response = await http
        .get(Uri.parse(AppConfig.kTeamBaseUrl + AppConfig.kGetAllTeams));
    final jsonData = json.decode(response.body);
    // logger.i(jsonData);

    if (jsonData['success']) {
      //logger.i(jsonData['data']);
      final teamsData = jsonData['data'] as List<dynamic>;
      _teams = teamsData.map((teamData) => Team.fromJson(teamData)).toList();
      notifyListeners();
      return _teams;
    }

    return [];
  }

// ! selected players
  Player? _selectedPlayer;
  Map<String, Player> _selectedPlayersMap = {};

  Map<String, Player> get selectedPlayersMap => _selectedPlayersMap;

  set selectedPlayersMap(Map<String, Player> playersMap) {
    _selectedPlayersMap = playersMap;
    notifyListeners();
  }

  void addSelectedPlayerToMap({
    required String position,
    required Player player,
  }) {
    _selectedPlayersMap[position] = player;
    print("Length of a map ${_selectedPlayersMap.length}");

    notifyListeners();
  }

  void deleteFromSelectedPlayerToMap() {
    if (_selectedPlayersMap.isNotEmpty) {
      // Get the last key added to the map
      String lastKey = _selectedPlayersMap.keys.last;
      // Remove the last item from the map
      _selectedPlayersMap.remove(lastKey);
      notifyListeners();
    }
  }

  Player? get selectedPlayer => _selectedPlayer;

  set selectedPlayer(Player? player) {
    _selectedPlayer = player;
    notifyListeners();
  }

  // !! filtred player from search
  List<Player> filteredPlayers = [];

  void updateFilteredPlayers(String value) {
    filteredPlayers = playerss
        .where((player) => player.name.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  //! update user bank budget and chekc team selected (max 3)

  Map<String, int> _maxSelectedTeams = {};

  bool checkMaxTeam({required String teamName, required bool longPress}) {
    if (_maxSelectedTeams.containsKey(teamName) &&
        _maxSelectedTeams[teamName]! > 2) {
      return false;
    }
    _maxSelectedTeams[teamName] = (_maxSelectedTeams[teamName] ?? 0) + 1;
    notifyListeners();
    return true;
  }

  void resetcheckMaxTeam() {
    if (_maxSelectedTeams.isNotEmpty) {
      // Get the last key added to the map
      String lastKey = _maxSelectedTeams.keys.last;
      // Remove the last item from the map
      _maxSelectedTeams.remove(lastKey);
      print("Player was deleted Yes ");
      notifyListeners();
    }
  }

  // ! bank
  int amount = 100;

  bool amountSubstraction({required int value, required bool longPress}) {
    if (longPress) {
      amount == 100 ? amount = 100 : amount += value;
      // amount += value;
      print("Amount ${amount}");
      // Add the value if it's a long press
      notifyListeners();
      return true; // Indicate success for long press action
    } else {
      if (amount < value) {
        return false; // Indicate insufficient funds for tap action
      } else {
        amount == 0 ? amount = 0 : amount -= value;
        // amount -= value;
        notifyListeners();
        return true; // Indicate success for tap action
      }
    }
  }
}
