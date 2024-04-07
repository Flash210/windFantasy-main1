import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';

import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

class CustomSearch extends SearchDelegate {
  late List<Player> filteredPlayers;
  late List<Player> listOfPlayersFromApi;

  CustomSearch() {
    _initialize();
  }

  Future<void> _initialize() async {
    listOfPlayersFromApi = await sl<PlayerProvider>().fetchPlayerss();
    filteredPlayers = List.from(listOfPlayersFromApi);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 1.0,
      minChildSize: 0.2,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            Expanded(
              child: Consumer<PlayerProvider>(
                builder: (context, provider, _) {
                  final teams2 = provider.teams;
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: query.isEmpty
                        ? listOfPlayersFromApi.length
                        : filteredPlayers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final player = query.isEmpty
                          ? listOfPlayersFromApi[index]
                          : filteredPlayers[index];
                      final team = teams2.firstWhere(
                        (team) => team.id == player.teamId,
                        orElse: () => Team(
                          id: 0,
                          name: 'Unknown',
                          logo: '',
                        ),
                      );
                      return ListTile(
                        leading: Image.network(team.logo!),
                        title: Column(
                          children: [
                            Text(player.name),
                            const SizedBox(width: 10),
                            Text(
                              '£${player.price}m',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: player.position == 'Milieu'
                                ? Colors.blue
                                : player.position == 'Defenseur'
                                    ? Colors.green
                                    : player.position == 'Attaquant'
                                        ? const Color.fromARGB(
                                            255, 138, 126, 21)
                                        : Colors.red,
                          ),
                          child: MyCustomText(
                            text: player.position,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
