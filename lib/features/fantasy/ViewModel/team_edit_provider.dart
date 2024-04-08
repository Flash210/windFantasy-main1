import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';

import 'package:http/http.dart' as http;

class TeamEditProvider with ChangeNotifier {
  //! create user team
  Future<void> createUserTeam(TeamEdit userTeam, String? token) async {
    final url = Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kCreateTeam);
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: json.encode(userTeam.toJson()),
      );
      if (response.statusCode == 200) {
      } else {}
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }

// ! show team

  List<Team> _showLeagugeTeamList = [];

  List<Team> get showLeagugeTeamList => _showLeagugeTeamList;

  Future<List<Team>> showLeagugeTeamListF() async {
    final response = await http
        .get(Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kGetUserTeam));
    final jsonData = json.decode(response.body);
    // logger.i(jsonData);

    if (jsonData['success']) {
      //logger.i(jsonData['data']);
      final teamsData = jsonData['data'] as List<dynamic>;
      _showLeagugeTeamList =
          teamsData.map((teamData) => Team.fromJson(teamData)).toList();
      notifyListeners();
      return _showLeagugeTeamList;
    }

    return [];
  }
  // Future<void> showTeamAftercreation(int userId) async {
  //   final String? token = await sl<TokenManager>().getToken();
  //   Logger logger = Logger();

  //   try {
  //     final response = await http.get(
  //       Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kGetUserTeam),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final dynamic jsonData = json.decode(response.body);
  //       if (jsonData is List) {
  //         _fetchPlayersTeam = jsonData
  //             .map((item) => ShowTeam.fromJson(item as Map<String, dynamic>))
  //             .toList();
  //         print("is a list ");
  //       } else if (jsonData is Map) {
  //         _fetchPlayersTeam = [
  //           ShowTeam.fromJson(jsonData as Map<String, dynamic>)
  //         ];
  //         print("is a map ");
  //       } else {
  //         throw Exception('Invalid response format');
  //       }
  //       notifyListeners();
  //       logger.i(jsonData);
  //       logger.i('Team fetched successfully');
  //     } else {
  //       logger.e('Failed to fetch team');
  //       logger.e(response.body);
  //       throw Exception('Failed to load team');
  //     }
  //   } catch (error) {
  //     throw Exception('Network error: $error');
  //   }
  // }

  // Future<void> showTeamAftercreation(int userId) async {

  //   final String? token = await sl<TokenManager>().getToken();
  //   Logger logger = Logger();
  //   List<ShowTeam> _team = [];
  //   List<ShowTeam> get team  => _team;

  //   try {
  //     final response = await http.get(
  //       Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kGetUserTeam),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final dynamic jsonData = json.decode(response.body);
  //       if (jsonData is List) {
  //         _team = jsonData
  //             .map((item) => ShowTeam.fromJson(item as Map<String, dynamic>))
  //             .toList();
  //       } else if (jsonData is Map) {
  //         _team = [ShowTeam.fromJson(jsonData as Map<String, dynamic>)];
  //       } else {
  //         throw Exception('Invalid response format');
  //       }
  //       notifyListeners();
  //       logger.i(jsonData);
  //       logger.i('Team fetched successfully');
  //     } else {
  //       logger.e('Failed to fetch team');
  //       logger.e(response.body);
  //       throw Exception('Failed to load team');
  //     }
  //   } catch (error) {
  //     throw Exception('Network error: $error');
  //   }
  // }

  //! is Created Team
  bool _isCreated = false;

  bool get isCreated => _isCreated;

  void changeIsCreatedState(bool value) {
    _isCreated = value;
    notifyListeners();
  }

  // ! set team to list
  List<Team> _addTeamToList = [];

  List<Team> get addTeamToTeamList => _addTeamToList;

  void addTeamToTeamListF(Team team) {
    _addTeamToList.contains(team)
        ? _addTeamToList.remove(team)
        : _addTeamToList.add(team);
    // _selectedTeamsList.add(team);
    print("Team Added${_addTeamToList.length}");
    notifyListeners();
  }

  void resetTeamList(List<Team> teamList) {
    teamList = [];
    notifyListeners();
  }

  // ! player availabilty
  int _availablePlayer = 0;

  int get availablePlayer => _availablePlayer;

  void updateAvailablePlayer() {
    print("Selected List lenght ${_addTeamToList.length}");
    _availablePlayer = _addTeamToList.length;
    notifyListeners();
  }

  //! save team name and player name :
  String _teamName = "";

  String get teamName => _teamName;
  String _playerName = "";
  String get playerName => _playerName;
  int _playerPrice = 0;
  int get playerPrice => _playerPrice;

  void saveTeamPlayerInfos(
      {required String teamNameAttribute,
      required String playerNameAtrribute,required playerPrice}) {
    _teamName = teamNameAttribute;
    _playerName = playerNameAtrribute;
    _playerPrice = playerPrice;
    notifyListeners();
  }
}
