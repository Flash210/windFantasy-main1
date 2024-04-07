import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/functions/is_player_position.dart';
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
      .where(
        (element) => !selc.contains(element.id),
      )
      .where((element) => isPositionValidForPlayer(element, positionPlayer))
      .where((element) => element.price < sl<PlayerProvider>().amount)
      .toList(); // Copy all players initially

  /*print(
      " sl<PlayerProvider>().listForFilter.length${sl<PlayerProvider>().listForFilter.length}");*/
  String searchCriteria = 'Search by Player Name'; // Default search criteria

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
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
                          // setState(() {
                          //    sl<PlayerProvider>().listForFilter = _filterPlayers(
                          //       value,
                          //       searchCriteria,
                          //       listOfPlayersFromApi,
                          //       teams);
                          // });
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
                          // String? selectedCriteria =
                          //     await _showSearchCriteriaDialog(context);
                          // if (selectedCriteria != null) {
                          //   setState(() {
                          //     searchCriteria = selectedCriteria;
                          //   });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                listOfPlayers: listOfPlayersFromApi,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Expanded(
                child: Consumer<PlayerProvider>(
                  builder: (BuildContext context, PlayerProvider list,
                          Widget? child) =>
                      ListWheelScrollView(
                    controller: scrollController,
                    itemExtent: 100, // Adjust the height of each item
                    children: List.generate(list.listForFilter.length, (index) {
                      final player = list.listForFilter[index];
                      final team = teams.firstWhere(
                        (team) => team.id == player.teamId,
                        orElse: () => Team(
                          id: 0,
                          name: 'Unknown',
                          logo: '',
                        ),
                      );
                      return ListTile(
                        onTap: () {
                          bool maxTeam = sl<PlayerProvider>()
                              .checkMaxTeam(teamName: team.name!);

                          bool enoughMoeny = sl<PlayerProvider>()
                              .amountSubstraction(player.price, context);

                          print("flouss " +
                              sl<PlayerProvider>().amount.toString());

                          if (enoughMoeny && maxTeam) {
                            context
                                .read<PlayerProvider>()
                                .addSelectedPlayerToMap(
                                    position: positionPlayer, player: player);
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: maxTeam == false
                                    ? const MyCustomText(
                                        text: "Max team Selection reached ")
                                    : const MyCustomText(
                                        text: 'You don\'t have enough money'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            Navigator.pop(context);
                          }
                          {}
                        },
                        leading: Image.network(team.logo!),
                        title: Column(
                          children: [
                            // Text(player.name),
                            MyCustomText(text: player.name),
                            const SizedBox(width: 10),
                            MyCustomText(
                              text: '£${player.price}m',
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
                            color: player.position == MyRes.kMidfilder
                                ? Colors.blue
                                : player.position == MyRes.kDefender
                                    ? Colors.green
                                    : player.position == MyRes.kForward
                                        ? const Color.fromARGB(
                                            255, 138, 126, 21)
                                        : Colors.red,
                          ),
                          child: MyCustomText(
                            text: player.position,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
