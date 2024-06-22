import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/View/widgets/create_player_icon.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:front/features/fantasy/Controller/show_team_provider.dart';
import 'package:front/features/fantasy/Controller/team_edit_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

buildTeamSection(
    Map<String, Player> slectedPlayerFromMap,
    Map<String, int> playerPositions,
    BuildContext context,
    List<int> forwards,
    List<int> midfielders,
    List<int> defenders,
    List<int> goalkeepers,
    int playersSelected,
    {required List<ShowTeam> listOfFantasyPlayers}) {
  return Consumer<TeamEditProvider>(
    builder: (context, teamEditProvider, _) => Column(children: [
      MySizedBox(height: ScreenUtils.getHeight(context) * 0.020),

      buildPlayerPositionInTheStatdium(MyRes.kGoalKepper, slectedPlayerFromMap,
          playerPositions, context, playersSelected),
      MySizedBox(height: ScreenUtils.getHeight(context) * 0.020),

      // ! Defenders Row
      buildPlayerPositionInTheStatdium(MyRes.kDefender, slectedPlayerFromMap,
          playerPositions, context, playersSelected),

      MySizedBox(height: ScreenUtils.getHeight(context) * 0.020),
      // ! midfilders Row
      buildPlayerPositionInTheStatdium(MyRes.kMidfilder, slectedPlayerFromMap,
          playerPositions, context, playersSelected),
      // ! Strikers Row
      MySizedBox(height: ScreenUtils.getHeight(context) * 0.020),
      buildPlayerPositionInTheStatdium(MyRes.kForward, slectedPlayerFromMap,
          playerPositions, context, playersSelected),

      MySizedBox(height: ScreenUtils.getHeight(context) * 0.08),
      // ! Bench Row
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: MyColors.greyF,
        ),
        width: ScreenUtils.getWidth(context) * 0.9,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Benched Players',
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )),
            MySizedBox(height: ScreenUtils.getHeight(context) * 0.01),
            // ! the place where the benched players will be shown
            buildBenchedPlayerPositionInSatduim("bench", slectedPlayerFromMap,
                playerPositions, context, playersSelected),
          ],
        ),
      ),

      const MySizedBox(height: 10),

      IconButton(
          onPressed: () {
            // sl<TokenManager>()
            //   ..savePlayerPositionToMap(
            //       map: sl<ShowTeamProvider>().savePlayerPostion)
            //   ..saveTshirtTeamToMap(map: sl<ShowTeamProvider>().saveTeamShirt);

            // sl<TeamEditProvider>()
            sl<AuthProvider>().addMap(sl<ShowTeamProvider>().savePlayerPostion);
            sl<AuthProvider>()
                .addMapTshirt(sl<ShowTeamProvider>().saveTeamShirt);

            teamEditProvider
                .createUserTeam(
                  TeamEdit(
                    forwards: forwards,
                    midfielders: midfielders,
                    defenders: defenders,
                    goalkeepers: goalkeepers,
                    moneyRemaining: sl<PlayerProvider>().amount,
                    playersSelected: 15,
                  ),
                )
                .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const MyCustomText(text: 'Team Created  :)'),
                        backgroundColor: MyColors.kGreen,
                      ),
                    ));
          },
          icon: Image.asset(
            "assets/TeamDone.png",
            width: 50,
            height: 50,
          )),
    ]),
  );
}
