

import 'package:flutter/material.dart';
import 'package:front/core/common_widget/my_costum_sizedbox.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/View/widgets/create_player_widget.dart';
import 'package:front/features/fantasy/View/widgets/show_player_widget.dart';
import 'package:front/features/fantasy/functions/submit_function.dart';
import 'package:google_fonts/google_fonts.dart';


// ! Team Section before Creation
Column buildTeamSection(
    Map<String, Player> slectedPlayerFromMap,
    Map<String, int> playerPositions,
    BuildContext context,
    List<int> forwards,
    List<int> midfielders,
    List<int> defenders,
    List<int> goalkeepers,
    int moneyRemaining,
    int playersSelected) {
  return Column(children: [
    const MySizedBox(height: 15),

    buildPlayerPositionInTheStatdium("Gardien", slectedPlayerFromMap,
        playerPositions, context, playersSelected),
    const MySizedBox(height: 10),

    // ! Defenders Row
    buildPlayerPositionInTheStatdium("Defenseur", slectedPlayerFromMap,
        playerPositions, context, playersSelected),

    // buildPosition("def", slectedPlayerFromMap, playerPositions),
    // ! midfilders Row
    const MySizedBox(height: 20),
    buildPlayerPositionInTheStatdium("Milieu", slectedPlayerFromMap,
        playerPositions, context, playersSelected),
    // ! Strikers Row
    const MySizedBox(height: 20),
    buildPlayerPositionInTheStatdium("Attaquant", slectedPlayerFromMap,
        playerPositions, context, playersSelected),

    const MySizedBox(height: 100),
    // ! Bench Row
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: MyColors.greyF,
      ),
      width: 300,
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
          const SizedBox(height: 16),
          // ! the place where the benched players will be shown
          buildBenchedPlayerPositionInSatduim("bench", slectedPlayerFromMap,
              playerPositions, context, playersSelected),
        ],
      ),
    ),

    const MySizedBox(height: 10),

    ElevatedButton(
        onPressed: () async {
          final String? token = await sl<TokenManager>().getToken();

          submit(forwards, midfielders, defenders, goalkeepers, moneyRemaining,
              playersSelected, token,context);
        },
        child: const Text(" Create Team"))
  ]);
}


//! Team Section after creation
Column buildTeamSectionAfterCreation(
    Map<String, Player> slectedPlayerFromMap,
    Map<String, int> playerPositions,
    BuildContext context,
    List<int> forwards,
    List<int> midfielders,
    List<int> defenders,
    List<int> goalkeepers,
    int moneyRemaining,
    int playersSelected) {
  return Column(children: [
    const MySizedBox(height: 15),

    buildShowPlayerPositionInTheStatdium("Gardien", slectedPlayerFromMap,
        playerPositions, context, playersSelected),
    const MySizedBox(height: 10),

    // ! Defenders Row
    buildShowPlayerPositionInTheStatdium("Defenseur", slectedPlayerFromMap,
        playerPositions, context, playersSelected),

    // buildPosition("def", slectedPlayerFromMap, playerPositions),
    // ! midfilders Row
    const MySizedBox(height: 20),
    buildShowPlayerPositionInTheStatdium("Milieu", slectedPlayerFromMap,
        playerPositions, context, playersSelected),
    // ! Strikers Row
    const MySizedBox(height: 20),
    buildShowPlayerPositionInTheStatdium("Attaquant", slectedPlayerFromMap,
        playerPositions, context, playersSelected),

    const MySizedBox(height: 100),
    // ! Bench Row
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: MyColors.greyF,
      ),
      width: 300,
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
          const SizedBox(height: 16),
          // ! the place where the benched players will be shown
          buildShowBenchedPlayerPositionInSatduim("bench", slectedPlayerFromMap,
              playerPositions, context, playersSelected),
        ],
      ),
    ),

    const MySizedBox(height: 10),

  ]);
}
