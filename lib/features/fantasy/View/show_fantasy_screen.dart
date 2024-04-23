import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/player_icon.dart';
import 'package:front/features/player%20card/functions/player_statistics.dart';
import 'package:front/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

Column buildShowFantasyTeam(
    {required BuildContext context,
    required List<Player> allPlayers,
    required List<ShowTeam> listOfFantasyPlayers,
    required Map<String, dynamic> myMap,
    required Map<String, dynamic> myTshirtMap}) {
  return Column(
    children: [
      MySizedBox(
        height: ScreenUtils.getHeight(context) * 0.06,
      ),
      buildPlayerIcon(
        myTshirtMap: myTshirtMap,
        context: context,
        playerName: getTextToShow(
            listOfFantasyPlayers, allPlayers, myMap, MyRes.kGoalKepper1),
        playerPosition: MyRes.kGoalKepper1,
        isItBenched: "No",
        onTap: () {

          navigateToPlayerCard(context, allPlayers, listOfFantasyPlayers, myMap,
              myTshirtMap, MyRes.kGoalKepper1, S.of(context).GoalKepper);
        },
      ),
      const SizedBox(height: 15),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildPlayerIcon(
          myTshirtMap: myTshirtMap,
          context: context,
          playerName: getTextToShow(
              listOfFantasyPlayers, allPlayers, myMap, MyRes.kDefenders[0]),
          playerPosition: MyRes.kDefenders[0],
          isItBenched: "No",
          onTap: () {
            navigateToPlayerCard(
                context,
                allPlayers,
                listOfFantasyPlayers,
                myMap,
                myTshirtMap,
                MyRes.kDefenders[0],
                S.of(context).Defender);
          },
        ),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kDefenders[1],
                  S.of(context).Defender);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kDefenders[1]),
            playerPosition: MyRes.kDefenders[1],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kDefenders[2],
                  S.of(context).Defender);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kDefenders[2]),
            playerPosition: MyRes.kDefenders[2],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kDefenders[3],
                  S.of(context).Defender);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kDefenders[3]),
            playerPosition: MyRes.kDefenders[3],
            isItBenched: "No"),
      ]),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kMidfielders[0],
                  S.of(context).Midfildier);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kMidfielders[0]),
            playerPosition: MyRes.kMidfielders[0],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kMidfielders[1],
                  S.of(context).Midfildier);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kMidfielders[1]),
            playerPosition: MyRes.kMidfielders[1],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kMidfielders[2],
                  S.of(context).Midfildier);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kMidfielders[2]),
            playerPosition: MyRes.kMidfielders[2],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kMidfielders[3],
                  S.of(context).Midfildier);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kMidfielders[3]),
            playerPosition: MyRes.kMidfielders[3],
            isItBenched: "No"),
      ]),
      const SizedBox(height: 30),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kForwards[0],
                  S.of(context).Forward);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kForwards[0]),
            playerPosition: MyRes.kForwards[0],
            isItBenched: "No"),
        buildPlayerIcon(
            onTap: () {
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMap,
                  myTshirtMap,
                  MyRes.kForwards[1],
                  S.of(context).Forward);
            },
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, MyRes.kForwards[1]),
            playerPosition: MyRes.kForwards[1],
            isItBenched: "No"),
      ]),
      const SizedBox(height: 30),
      const SizedBox(height: 30),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: MyColors.greyF,
        ),
        width: 300,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Benched Players',
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              buildBenchedPlayerIcon(
                  myTshirtMap: myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      listOfFantasyPlayers, allPlayers, myMap, "bench1"),
                  playerPosition: "bench1",
                  isItBenched: "Yes"),
              buildBenchedPlayerIcon(
                  myTshirtMap: myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      listOfFantasyPlayers, allPlayers, myMap, "bench2"),
                  playerPosition: "bench2",
                  isItBenched: "Yes"),
              buildBenchedPlayerIcon(
                  myTshirtMap: myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      listOfFantasyPlayers, allPlayers, myMap, "bench3"),
                  playerPosition: "bench3",
                  isItBenched: "Yes"),
              buildBenchedPlayerIcon(
                  myTshirtMap: myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      listOfFantasyPlayers, allPlayers, myMap, "bench4"),
                  playerPosition: "bench4",
                  isItBenched: "Yes"),
            ]),
          ],
        ),
      ),
    ],
  );
}
