import 'package:flutter/material.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/repository/player_repository.dart';

class PlayerProvider extends ChangeNotifier {
  final PlayerRepository playerRepository;

  PlayerProvider({required this.playerRepository});

// ! This method fetches all the players from the server

  List<Player> players = [];

  Future<List<Player>> fetchPlayerss() async {
    players = await playerRepository.fetchPlayers();
    notifyListeners();

    return players;
  }

//! list of players in the bottom sheet
  List<Player> _listForFilter = [];

  List<Player> get listForFilter => _listForFilter;

  set listForFilter(List<Player> value) {
    _listForFilter = value;
    // print("aaaaaaaaaa${value.map((e) => e.price)}");
    // print("aaaaaaaaaa2${value.map((e) => e.position)}");

    // print("aaaaaaaaaa3${value.map((e) => e.teamId)}");
    notifyListeners();
  }

// ! This method fetches all  Teams from the server

  List<Team> _teams = [];

  List<Team> get teams => _teams;

  Future<List<Team>> fetchTeams() async {
    _teams = await playerRepository.fetchTeams();
    notifyListeners();
    return _teams;
  }

// ! selected players
  // Player? _selectedPlayer;
  Map<String, Player> _selectedPlayersMap = {};

  Map<String, Player> get selectedPlayersMap => _selectedPlayersMap;

  // set selectedPlayersMap(Map<String, Player> playersMap) {
  //   _selectedPlayersMap = playersMap;
  //   notifyListeners();
  // }

  void addSelectedPlayerToMap(
      {required String position, required Player player}) {
    _selectedPlayersMap[position] = player;

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

  // Player? get selectedPlayer => _selectedPlayer;

  // set selectedPlayer(Player? player) {
  //   _selectedPlayer = player;
  //   notifyListeners();
  // }

  // !! filtred player from search
  // List<Player> filteredPlayers = [];

  // void updateFilteredPlayers(String value) {
  //   filteredPlayers = players
  //       .where((player) => player.name.toLowerCase().contains(value))
  //       .toList();
  //   notifyListeners();
  // }

  //! update user bank budget and chekc team selected (max 3)

  // ! bank
  int amount = 100;

  bool amountSubstraction({required int value, required bool longPress}) {
    if (longPress) {
      amount == 100 ? amount = 100 : amount += value;
     
      print("Amount ${amount}");
      
      notifyListeners();
      return true; 
    } else {
      if (amount < value) {
        return false; 
      } else {
        amount == 0 ? amount = 0 : amount -= value;
        
        notifyListeners();
        return true; 
      }
    }
  }
}
