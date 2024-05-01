import 'package:flutter/material.dart';

import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/functions/bottom_sheet_features.dart';
import 'package:front/features/fantasy/functions/edit_team_functions.dart';
import 'package:front/features/filter/View/filtred_screen.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

void showListOfPlayers222(
    {required BuildContext context, required String positionPlayer}) async {
  final List<Player> listOfPlayersFromApi =
      await sl<PlayerProvider>().fetchPlayerss();

  final List<Team> teams = await sl<PlayerProvider>().fetchTeams();

  List<int> selc = context
      .read<PlayerProvider>()
      .selectedPlayersMap
      .values
      .map((e) => e.id)
      .toList();
  sl<PlayerProvider>().listForFilter = List.from(listOfPlayersFromApi)
      .cast<Player>()
      .where((element) => !selc.contains(element.id))
      .where((element) => isPositionValidForPlayer(element, positionPlayer))
      .where((element) => element.price < sl<PlayerProvider>().amount)
      // .where((element) => !sl<TeamEditProvider>()
      //     .playersAfterMaxReached
      //     .any((playerReached) => playerReached == element)

      .toList(); // Copy all players initially

  String searchCriteria = 'Search by Player Name';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 1.0,
          minChildSize: 0.2,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              sl<PlayerProvider>().listForFilter =
                                  _filterPlayers(value, searchCriteria,
                                      listOfPlayersFromApi, teams);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: searchCriteria,
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilteredPage(
                                  position: positionPlayer,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<PlayerProvider>(
                    builder: (BuildContext context,
                            PlayerProvider playerProvider, Widget? child) =>
                        ListWheelScrollView(
                      controller: scrollController,
                      itemExtent: 100, // Adjust the height of each item
                      children: List.generate(
                          playerProvider.listForFilter.length, (index) {
                        final player = playerProvider.listForFilter[index];
                        final team = teams.firstWhere(
                          (team) => team.id == player.teamId,
                          orElse: () => Team(
                            id: 0,
                            name: 'Unknown',
                            logo: '',
                          ),
                        );
                        return buildBottomSheetListTitle(team, player, context,
                            positionPlayer, playerProvider.listForFilter);
                      }),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      });
    },
  );
}

List<Player> _filterPlayers(String value, String searchCriteria,
    List<Player> listOfPlayers, List<Team> teams) {
  switch (searchCriteria) {
    case 'Search by Player Name':
      return listOfPlayers
          .where((player) =>
              player.name.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
    case 'Search by Player Position':
      return listOfPlayers
          .where((player) =>
              player.position.toLowerCase().contains(value.toLowerCase()))
          .toList();
    case 'Search by Player Price':
      return listOfPlayers
          .where((player) => player.price
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();

    case 'Search by Team Name':
      return listOfPlayers
          .where((player) => teams.any((team) =>
              team.id == player.teamId &&
              team.name!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    default:
      return listOfPlayers;
  }
}
