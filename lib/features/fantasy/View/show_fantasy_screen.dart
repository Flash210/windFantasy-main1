import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/player_icon.dart';
import 'package:front/features/fantasy/functions/edit_team_functions.dart';
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
        playerName:
            getTextToShow(listOfFantasyPlayers, allPlayers, myMap, "Gardien1"),
        playerPosition: "Gardien1",
        isItBenched: "No",
        onTap: () {
          showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text("Choisissez un nouveau gardien",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )));
              });
        },
      ),
      SizedBox(height: 15),
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

String getTextToShow(List<ShowTeam> listOfFantasyPlayers,
    List<Player> allPlayers, Map<String, dynamic> myMap, String position) {
  String playerPos = myMap[position] ?? "";
  return listOfFantasyPlayers.any((element) =>
          getPlayerName(element.playerId!, allPlayers) == playerPos)
      ? playerPos
      : " No PLayer Found";
}
