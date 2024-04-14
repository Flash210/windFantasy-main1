import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fixtures/Model/fixture.dart';
import 'package:front/features/fixtures/ViewModel/fixture_provider.dart';

// ! get team abbreviation

String getTeamAbbreviation(String teamName) {
  // Define abbreviations for specific team names
  Map<String, String> teamAbbreviations = {
    'AS Roma': 'ROM',
    'Atalanta': 'ATA',
    'Bologna': 'BOG',
    'Cagliari': 'CAG',
    'Empoli': 'EMP',
    'Fiorentina': 'FIO',
    'Frosinone': 'FRO',
    'Genoa': 'GEN',
    'Verona': 'VER',
    'Inter': 'INT',
    'Juventus': 'JUV',
    'Lazio': 'LAZ',
    'Lecce': 'LEC',
    'AC Milan': 'MIL',
    'Monza': 'MON',
    'Napoli': 'NAP',
    'Salernitana': 'SAL',
    'Sassuolo': 'SAS',
    'Torino': 'TOR',
    'Udinese': 'UDI',
  };

  if (teamAbbreviations.containsKey(teamName)) {
    return teamAbbreviations[teamName]!;
  } else {
    return teamName;
  }
}

// ! extract date from date time string
String extractDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return formattedDate;
}

// ! build win,lose or draw  result container

Widget buildResultContainer(int res1, int res2) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: res1 > res2
          ? Colors.green
          : res1 < res2
              ? Colors.red
              : Colors.grey,
      // borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        res1.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// ! fetch data from Fixtures provider (api )
Future<List<Fixture>> fetchFixtures() async {
  return sl<FixtureProvider>().getFixtures();
}
// ! fetch data from Player provider (api )

Future<List<Team>> fetchTeams() async {
  return sl<PlayerProvider>().fetchTeams();
}
// ! filter fixtures by gameweek that can help as to display fixtures by gameweek

List<Fixture> filterFixturesByGameweek(List<Fixture> fixtures, int gameweek) {
  return fixtures.where((fixture) => fixture.gameWeek == gameweek).toList();
}

// ! filter fixtures by team that can help as to display fixtures by team
Map<String, List<Fixture>> groupFixturesByDate(List<Fixture> fixtures) {
  Map<String, List<Fixture>> groupedFixtures = {};
  for (var fixture in fixtures) {
    String date = extractDate(fixture.date!);
    if (groupedFixtures.containsKey(date)) {
      groupedFixtures[date]!.add(fixture);
    } else {
      groupedFixtures[date] = [fixture];
    }
  }
  return groupedFixtures;
}

//

// ! this widget is responsable for displaying team logo,name (home and away) and result of the match
Column buildTeamDetails(Team homeTeam, Team awayTeam, Fixture fixture) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTeamAndName(team: homeTeam, textRight: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ? Build result container for home team
              buildResultContainer(fixture.resultHome!, fixture.resultAway!),
              // ? Build result container for away team

              buildResultContainer(fixture.resultAway!, fixture.resultHome!),
            ],
          ),
          buildTeamAndName(team: awayTeam, textRight: true),
        ],
      ),
      const SizedBox(height: 10)
    ],
  );
}
