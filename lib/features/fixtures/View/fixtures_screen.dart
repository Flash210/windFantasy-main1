import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fixtures/Model/fixture.dart';
import 'package:front/features/fixtures/utils/commun_function.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({super.key});

  @override
  FixturesScreenState createState() => FixturesScreenState();
}

class FixturesScreenState extends State<FixturesScreen> {
  late Future<List<Fixture>> _fixturesFuture;
  late Future<List<Team>> _teamsFuture;
  int currentGameweek = 15; // Initial gameweek value
  bool increment = false;

  @override
  void initState() {
    super.initState();
    _fixturesFuture = fetchFixtures();
    _teamsFuture = fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: buildFixtureAppBar(currentGameweek),
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.wait([_fixturesFuture, _teamsFuture]),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Fixture> allFixtures =
                      snapshot.data![0] as List<Fixture>;
                  List<Team> teams = snapshot.data![1] as List<Team>;

                  List<Fixture> filteredFixtures =
                      filterFixturesByGameweek(allFixtures, currentGameweek);

                  Map<String, List<Fixture>> groupedFixtures =
                      groupFixturesByDate(filteredFixtures);

                  return ListView.builder(
                    itemCount: groupedFixtures.length,
                    itemBuilder: (context, index) {
                      String date = groupedFixtures.keys.elementAt(index);
                      List<Fixture> fixtures = groupedFixtures[date]!;
                      return Column(
                        children: [
                          ListTile(
                            // title: Text(
                            //   date,
                            //   style: const TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            title: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: MyColors.kSecondaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  date,
                                  style: GoogleFonts.rubikScribble(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: fixtures.length,
                            itemBuilder: (context, index) {
                              final fixture = fixtures[index];
                              final homeTeam = teams.firstWhere(
                                (team) => team.id == fixture.homeTeamId,
                                orElse: () => Team(),
                              );
                              final awayTeam = teams.firstWhere(
                                (team) => team.id == fixture.awayTeamId,
                                orElse: () => Team(),
                              );

                              return buildTeamDetails(
                                  homeTeam, awayTeam, fixture);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

// ! Fixture App bar
  Row buildFixtureAppBar(int currentGameweek) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildArrowNavigation(
            Colors.red, increment = false, Icons.arrow_left_sharp),
        Image.asset(MyRes.kLeagueLogo, width: 70, height: 70),
        Expanded(
          child: Text(
            // '${S.of(context).} $currentGameweek',
            'Gameweek \n $currentGameweek',

            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildArrowNavigation(
            Colors.green, increment = true, Icons.arrow_right_sharp),
      ],
    );
  }

  Shimmer buildArrowNavigation(Color color, bool increment, IconData icon) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[100]!,
      highlightColor: color,
      child: IconButton(
        icon: Icon(icon),
        iconSize: 40,
        onPressed: () {
          setState(() {
            if (increment) {
              currentGameweek == 38 ? currentGameweek = 38 : currentGameweek++;
            } else {
              currentGameweek == 12 ? currentGameweek = 12 : currentGameweek--;
            }
            
          });
        },
      ),
    );
  }
}
