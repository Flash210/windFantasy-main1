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

Widget buildResultContainer(int res1, int res2, bool result) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: res1 > res2
          ? Colors.green
          : res1 < res2
              ? Colors.red
              : Colors.grey,
      // borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        result ? "-" : res1.toString(),
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

  // Sort the groupedFixtures map by day of the month
  List<String> sortedDates = groupedFixtures.keys.toList();
  sortedDates.sort((a, b) {
    int dayA = int.parse(a.split('-')[2]); // Extract day from date string
    int dayB = int.parse(b.split('-')[2]);
    return dayA.compareTo(dayB);
  });

  // Create a new map with sorted dates and sorted fixtures
  Map<String, List<Fixture>> sortedGroupedFixtures = {};
  for (var date in sortedDates) {
    sortedGroupedFixtures[date] = groupedFixtures[date]!;
    sortedGroupedFixtures[date]!.sort((a, b) => a.date!.compareTo(b.date!));
  }

  return sortedGroupedFixtures;

  // return groupedFixtures;
}

//

// ! this widget is responsable for displaying team logo,name (home and away) and result of the match
Column buildTeamDetails(Team homeTeam, Team awayTeam, Fixture fixture) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTeamAndName(team: homeTeam, textRight: false),
          Row(
            children: [
              // ? Build result container for home team
              buildResultContainer(fixture.resultHome!, fixture.resultAway!,
                  fixture.result!.isEmpty),
              // ? Build result container for away team
              SizedBox(width: 5),

              buildResultContainer(fixture.resultAway!, fixture.resultHome!,
                  fixture.result!.isEmpty),
            ],
          ),
          buildTeamAndName(team: awayTeam, textRight: true),
        ],
      ),
    ],
  );
}
