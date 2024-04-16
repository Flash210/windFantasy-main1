import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/player_icon.dart';
import 'package:front/features/player%20card/View/player_card.dart';
import 'package:front/features/player%20card/functions/player_statistics.dart';
import 'package:front/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

Column buildShowFantasyTeam(
    {required BuildContext context,
    required List<Player> allPlayers,
    required List<ShowTeam> listOfFantasyPlayers,
    required Map<String, dynamic> myMap,
    required Map<String, dynamic> myTshirtMap}) {
  print(listOfFantasyPlayers.length);

  return Column(
    children: [
      buildPlayerIcon(
        myTshirtMap: myTshirtMap,
        context: context,
        playerName: getTextToShow(
            listOfFantasyPlayers, allPlayers, myMap, MyRes.kGoalKepper1),
        playerPosition: MyRes.kGoalKepper1,
        isItBenched: "No",
        onTap: () {
         /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerCard(
                // player: listOfFantasyPlayers.any((element) => 
                // getPlayerStatistic(element.id, allPlayers) ),
                player: getPlayerStatistic(list: listOfFantasyPlayers, players: allPlayers),
                  teamName: getTshirtTeamToShow(
                    nameOfPlayer: getTextToShow(listOfFantasyPlayers,
                        allPlayers, myMap, MyRes.kGoalKepper1),
                    map: myTshirtMap,
                  ),
                  teamTshirt: getTshirtTeamToShow(
                    nameOfPlayer: getTextToShow(listOfFantasyPlayers,
                        allPlayers, myMap, MyRes.kGoalKepper1),
                    map: myTshirtMap,
                  ),
                  position: S.of(context).GoalKepper,
                  playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                      myMap, MyRes.kGoalKepper1)),
            ),
          );*/
          navigateToPlayerCard(context, allPlayers, listOfFantasyPlayers, myMap,
              myTshirtMap, MyRes.kGoalKepper1,S.of(context).GoalKepper);
        },
      ),
      const SizedBox(height: 15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur1"),
            playerPosition: "Defenseur1",
            isItBenched: "No",
            onTap: () {}),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur2"),
            playerPosition: "Defenseur2",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur3"),
            playerPosition: "Defenseur3",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Defenseur4"),
            playerPosition: "Defenseur4",
            isItBenched: "No"),
      ]),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu1"),
            playerPosition: "Milieu1",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu2"),
            playerPosition: "Milieu2",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu3"),
            playerPosition: "Milieu3",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Milieu4"),
            playerPosition: "Milieu4",
            isItBenched: "No"),
      ]),
      const SizedBox(height: 30),
      const SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Attaquant1"),
            playerPosition: "Attaquant1",
            isItBenched: "No"),
        buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(
                listOfFantasyPlayers, allPlayers, myMap, "Attaquant2"),
            playerPosition: "Attaquant2",
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




