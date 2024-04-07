import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';

// ! create team
Future<void> createTeam(
    BuildContext context, TeamEdit team, String token) async {
  try {
    await sl<TeamEditProvider>()
        .createUserTeam(team, token)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Team submitted successfully!'),
                backgroundColor: Colors.green,
              ),
            ));
    // Handle successful submission (e.g., navigate to confirmation screen)
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to submit team: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// ! filtred by criteria

Future<String?> _showSearchCriteriaDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Search Criteria'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Player Name'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Name');
              },
            ),
            ListTile(
              title: const Text('Player Position'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Position');
              },
            ),
            ListTile(
              title: const Text('Player Price'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Price');
              },
            ),
            ListTile(
              title: const Text('Team Name'),
              onTap: () {
                Navigator.pop(context, 'Search by Team Name');
              },
            ),
          ],
        ),
      );
    },
  );
}

// ! filtred player by

List<Player> _filterPlayers(String value, String searchCriteria,
    List<Player> listOfPlayers, List<Team> teams) {
  switch (searchCriteria) {
    case 'Search by Player Name':
      return listOfPlayers
          .where((player) =>
              player.name.toLowerCase().contains(value.toLowerCase()))
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
