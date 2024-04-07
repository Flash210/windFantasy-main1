import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/my_costum_sizedbox.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/app_bar_widget.dart';

import 'package:front/features/fantasy/View/widgets/team_section.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FantasyScreen extends StatefulWidget {
  const FantasyScreen({super.key});

  @override
  State<FantasyScreen> createState() => _FantasyScreenState();
}

class _FantasyScreenState extends State<FantasyScreen> {
  late Future<UserModel?> _userModel;
  late List<ShowTeam> fetchPlayersTeam;

  @override
  void initState() {
    super.initState();
    _userModel = sl<AuthProvider>().getUserInfo();
    // fetchPlayersTeam =
    //     sl<TeamEditProvider>().showLeagugeTeam;
  }

  bool isCreated = sl<TeamEditProvider>().isCreated;
  late int playerSelected;
  late int moneyRemaining;

  @override
  Widget build(BuildContext context) {
    print(
        "+++++++++++++++${sl<TeamEditProvider>().showLeagugeTeamList.length}");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: _userModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data!.data;
                playerSelected = userData.playersSelected;
                moneyRemaining = userData.bank;
                print("Players Selected $playerSelected");
                return Column(
                  children: [
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.11,
                    ),

                    Text(snapshot.data!.data.teamName,
                        style: GoogleFonts.raviPrakash(
                          textStyle: const TextStyle(
                              color: MyColors.kBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        )),

                    buildAppBar(),
                    MySizedBox(
                      height: ScreenUtils.getHeight(context) * 0.033,
                    ),

                    // ! ...............................
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/empty.png'),
                              fit: BoxFit.fill)),
                      // child: InteractiveViewer(
                      //   constrained: false,
                      child: Stack(
                        children: [
                          Consumer<PlayerProvider>(
                            builder: (context, playerProvider, child) {
                              final slectedPlayerFromMap =
                                  playerProvider.selectedPlayersMap;

                              final List<int> forwards = [
                                slectedPlayerFromMap["Attaquant1"]?.id ?? 0,
                                slectedPlayerFromMap["Attaquant1"]?.id ?? 0,
                                slectedPlayerFromMap["bench1"]?.id ?? 0,
                                slectedPlayerFromMap["bench2"]?.id ?? 0,
                              ];

                              final List<int> midfielders = [
                                slectedPlayerFromMap["Milieu1"]?.id ?? 0,
                                slectedPlayerFromMap["Milieu2"]?.id ?? 0,
                                slectedPlayerFromMap["Milieu3"]?.id ?? 0,
                                slectedPlayerFromMap["Milieu4"]?.id ?? 0,
                                slectedPlayerFromMap["bench3"]?.id ?? 0,
                                slectedPlayerFromMap["bench4"]?.id ?? 0,
                              ];

                              final List<int> defenders = [
                                slectedPlayerFromMap["Defenseur1"]?.id ?? 0,
                                slectedPlayerFromMap["Defenseur2"]?.id ?? 0,
                                slectedPlayerFromMap["Defenseur3"]?.id ?? 0,
                                slectedPlayerFromMap["Defenseur4"]?.id ?? 0,
                              ];

                              final List<int> goalkeepers = [
                                slectedPlayerFromMap["Gardien1"]?.id ?? 0,
                              ];
                              final playerPositions = {
                                "Gardien": 1,
                                "Defenseur": 4,
                                "Milieu": 4,
                                "Attaquant": 2,
                                "bench": 4,
                              };

                              return playerSelected != 15
                                  ? buildTeamSection(
                                      slectedPlayerFromMap,
                                      playerPositions,
                                      context,
                                      forwards,
                                      midfielders,
                                      defenders,
                                      goalkeepers,
                                      moneyRemaining,
                                      playerSelected)
                                  : buildTeamSectionAfterCreation(
                                      slectedPlayerFromMap,
                                      playerPositions,
                                      context,
                                      forwards,
                                      midfielders,
                                      defenders,
                                      goalkeepers,
                                      moneyRemaining,
                                      playerSelected);

                              //return buildTeamSection(slectedPlayerFromMap, playerPositions, context, forwards, midfielders, defenders, goalkeepers, moneyRemaining, playersSelected);
                            },
                          )
                        ],
                      ),
                    ),
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const CircularProgressIndicator(); // Placeholder for loading state
              }
            },
          ),
        ),
      ),
    );
  }
}
