import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';

class FilterProvider with ChangeNotifier {
//! Ranage Price
  RangeValues _values = const RangeValues(4, 12);

  RangeValues get values => _values;

  set values(RangeValues newValues) {
    _values = newValues;
    notifyListeners(); 
  }

  // void updateValues(RangeValues newValues) {
  //   _values = newValues;
  //   notifyListeners(); // Notify listeners about the change
  // }

  void resetValues() {
    _values = const RangeValues(4, 12);
    notifyListeners(); // Notify listeners about the change
  }

// !! fill select team by user for filter

  List<Team> _filledListTeam = [];

  List<Team> get filledListTeam => _filledListTeam;

  void fillListTeamF(Team team) {
    if (_filledListTeam.contains(team)) {
      _filledListTeam.remove(team);
    } else {
      _filledListTeam.add(team);
    }

    notifyListeners();
  }

  // ! fill player by teams selected

  List<Player> _filteredPlayerByTeams = [];

  List<Player> get filteredPlayerByTeams => _filteredPlayerByTeams;

  void filterPlayerByTeamsF() async {
    final List<Player> allPlayers = await sl<PlayerProvider>().fetchPlayerss();
    List<int?> teamIds = _filledListTeam.map((team) => team.id).toList();

    // Filter players based on team ids
    _filteredPlayerByTeams =
        allPlayers.where((player) => teamIds.contains(player.teamId)).toList();

    notifyListeners();
  }

  // //! Filter By price

// ? filter player by price

  List<Player> _filteredPlayerByPrice = []; // Updated to store filtered players

  List<Player> get filteredPlayerByPrice => _filteredPlayerByPrice;

  void filterPlayerByPriceF(int minPrice, int maxPrice) {
    final List<Player> allPlayers = sl<PlayerProvider>().players;

    // Filter players based on price range
    _filteredPlayerByPrice = allPlayers
        .where((player) => player.price >= minPrice && player.price <= maxPrice)
        .toList();

    notifyListeners();
  }

  //! filter by position

  List<Player> _filteredPlayersByPosition = [];

  List<Player> get filteredPlayerByPosition => _filteredPlayersByPosition;

  void filterPlayersByPosition(String position, bool isChecked) {
    final List<Player> allPlayers = sl<PlayerProvider>().players;

    if (!isChecked) {
      _filteredPlayersByPosition +=
          allPlayers.where((player) => player.position == position).toList();
    } else {
      _filteredPlayersByPosition
          .removeWhere((player) => player.position == position);
    }

    notifyListeners();
  }

  // !reset list

  void resetListsF() {
    _filledListTeam = [];
    _filteredPlayerByTeams = [];
    _filteredPlayerByPrice = [];
    _filteredPlayersByPosition = [];
    filtredByThreeLists = [];
    sl<PlayerProvider>().listForFilter = sl<PlayerProvider>().players;
    _isDefenderSelected = false;
    _isMidfielderSelected = false;
    _isStrikerSelected = false;
    _isGoalkeeperSelected = false;
    resetValues();

    notifyListeners();
  }

// ! the big list filtred by 3
  List<Player> filtredByThreeLists = [];
  // List<Player> get filtredByThreeLists => _filtredByThreeLists;

  void filterByThreeLists(
      List<Player> pos, List<Player> teams, List<Player> price,
      {String? position}) async {
    filtredByThreeLists = _filteredPlayerByPrice.where((item) {
      return (_filteredPlayersByPosition.isEmpty ||
              _filteredPlayersByPosition.contains(item)) &&
          (_filteredPlayerByTeams.isEmpty ||
              _filteredPlayerByTeams.contains(item));
    }).toList();
    if (position == null) {
      sl<PlayerProvider>().listForFilter = filtredByThreeLists;
    } else {
      sl<PlayerProvider>().listForFilter = filtredByThreeLists
          .where((element) => element.position == position)
          .toList();
    }
    // print("Filtred List" +
    //     sl<PlayerProvider>().listForFilter.map((e) => e.price).toString());
    // print("Filtred List2" +
    //     sl<PlayerProvider>().listForFilter.map((e) => e.position).toString());

    // print("Filtred List3" +
    //     sl<PlayerProvider>().listForFilter.map((e) => e.teamId).toString());

    notifyListeners();
  }

  // ! change checkBox value
  bool _isStrikerSelected = false;

  bool get isStrikerSelected => _isStrikerSelected;

  void updateIsStrikerSelected(bool value) {
    _isStrikerSelected = value;
    notifyListeners(); // Notify listeners about the change
  }

  bool _isDefenderSelected = false;

  bool get isDefenderSelected => _isDefenderSelected;

  void updateIsDefenderSelected(bool value) {
    _isDefenderSelected = value;
    notifyListeners(); // Notify listeners about the change
  }

  bool _isMidfielderSelected = false;

  bool get isMidfielderSelected => _isMidfielderSelected;

  void updateIsMidfielderSelected(bool value) {
    _isMidfielderSelected = value;
    notifyListeners(); // Notify listeners about the change
  }

  bool _isGoalkeeperSelected = false;

  bool get isGoalkeeperSelected => _isGoalkeeperSelected;

  void updateIsGoalkeeperSelected(bool value) {
    _isGoalkeeperSelected = value;
    notifyListeners();
  }
}
