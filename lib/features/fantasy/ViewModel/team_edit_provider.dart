import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/Model/user_play.dart';
import 'package:front/features/fantasy/repository/team_repository.dart';

import 'package:http/http.dart' as http;

class TeamEditProvider with ChangeNotifier {
  //! create user team
  TeamRepository teamRepository;

  TeamEditProvider({required this.teamRepository});

  Future<void> createUserTeam(TeamEdit userTeam) async {
    await teamRepository.createTeam(
      teamEdit: userTeam,
    );
  }

  // ! user play gameWeek
  UserPlay? userPlay;
  Future<UserPlay> getUserPLay() async {
    try {
      userPlay = await teamRepository.getUserPLay();
      notifyListeners();
    } catch (e) {
      print("Error" + e.toString());
    }

    return userPlay!;
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

  //! check if maxTeam Sleected is Reached  and if not add player
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
  // int _availablePlayer = 0;

  // int get availablePlayer => _availablePlayer;

  // void updateAvailablePlayer() {
  //   print("Selected List lenght ${_addTeamToList.length}");
  //   _availablePlayer = _addTeamToList.length;
  //   notifyListeners();
  // }

  //! save team name and player name :
  String _teamName = "";

  String get teamName => _teamName;
  String _playerName = "";
  String get playerName => _playerName;
  int _playerPrice = 0;
  int get playerPrice => _playerPrice;

  void saveTeamPlayerInfos(
      {required String teamNameAttribute,
      required String playerNameAtrribute,
      required playerPrice}) {
    _teamName = teamNameAttribute;
    _playerName = playerNameAtrribute;
    _playerPrice = playerPrice;
    notifyListeners();
  }

  List<Team> teamsAfterMaxReached = [];

  void fillTeamsAfterMaxReached(Team team) {
    teamsAfterMaxReached.add(team);
    print("Team Reached$team");
    notifyListeners();
  }

  List<Player> playersAfterMaxReached = [];

  void fillPlayersMaxReached(Player player) {
    print("Team Reached" + player.toString());

    playersAfterMaxReached.add(player);
    notifyListeners();
  }
}
