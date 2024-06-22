import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/repository/player_repository.dart';
import 'package:get/get.dart';

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

  List<Player> _lazyPlayers = [];
  List<Player> get lazyPlayers => _lazyPlayers;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  Future<void> fetchNextPage() async {
    final newPlayers = List.generate(20, (index) => players[index + 1]);
    _lazyPlayers.addAll(newPlayers);
    _currentPage++;
    notifyListeners();
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
  final Map<String, Player> _selectedPlayersMap = {};

  Map<String, Player> get selectedPlayersMap => _selectedPlayersMap;

  void addSelectedPlayerToMap(
      {required String position, required Player player}) {
    _selectedPlayersMap[position] = player;

    notifyListeners();
  }

  void deleteFromSelectedPlayerToMap() {
    if (_selectedPlayersMap.isNotEmpty) {
      String lastKey = _selectedPlayersMap.keys.last;
      _selectedPlayersMap.remove(lastKey);
      notifyListeners();
    }
  }

  //! update user bank budget and chekc team selected (max 3)

  // ! bank
  int amount = 100;

  bool amountSubstraction({required int value, required bool longPress}) {
    if (longPress) {
      amount == 100 ? amount = 100 : amount += value;

      print("Amount $amount");

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

  setNewList(List<Player> l1, List<Player> l2) {
    l1 = l2;
    notifyListeners();
  }

  List<Player> _nameOf = []; // Updated to store filtered players

  List<Player> get nameOf => _nameOf;

  void filterNameOF({required String nameOf}) {
    final List<Player> allPlayers = sl<PlayerProvider>().players;

    _nameOf = allPlayers.where((player) => player.name == nameOf).toList();
    notifyListeners();
  }

  List<Player> _viewAllPlayers = []; 






fillViewAllPlayers() {
        sl<PlayerProvider>().fetchPlayerss();

    _viewAllPlayers = players;
    print("filled " + _viewAllPlayers.length.toString());
    notifyListeners();
  }




  List<Player> get viewAllPlayers => _viewAllPlayers;
  void filterPlayersByName(String name) async {
    if (name.isEmpty) {
      // If the search query is empty, show all players

      _viewAllPlayers = sl<PlayerProvider>().players;
      print("fifi elenth" + _viewAllPlayers.length.toString());
    } else {
      // Filter players whose name contains the search query
      _viewAllPlayers = players
          .where((player) =>
              player.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      print("fifi elenth" + _viewAllPlayers.length.toString());
    }
    notifyListeners();
  }
}
