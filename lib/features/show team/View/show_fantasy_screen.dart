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
import 'package:front/features/show%20team/Functions/commun_functions.dart';
import 'package:front/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowFantasyTeam extends StatelessWidget {
  final List<Player> allPlayers;
  final List<ShowTeam> listOfFantasyPlayers;
  final Map<String, dynamic> myMapOfPlayersName;
  final Map<String, dynamic> myTshirtMap;
final     List<bool> isCaptainList = List.generate(15, (index) => false);

   ShowFantasyTeam(
      {super.key,
      required this.allPlayers,
      required this.listOfFantasyPlayers,
      required this.myMapOfPlayersName,
      required this.myTshirtMap});

      

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          MySizedBox(
            height: ScreenUtils.getHeight(context) * 0.06,
          ),
          Text("lll"),
          buildPlayerIcon(
            myTshirtMap: myTshirtMap,
            context: context,
            playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                myMapOfPlayersName, MyRes.kGoalKepper1),
            playerPosition: MyRes.kGoalKepper1,
            isItBenched: "No",
            onTap: () async {
              // showIsCaptain(allPlayers:allPlayers,playerPosition:"Gardien1", myMapOfPlayersName: myMapOfPlayersName,
              //  listOfFantasyPlayers:listOfFantasyPlayers
              //  );
      
        
      
              navigateToPlayerCard(
                  context,
                  allPlayers,
                  listOfFantasyPlayers,
                  myMapOfPlayersName,
                  myTshirtMap,
                  MyRes.kGoalKepper1,
                  S.of(context).GoalKepper,
                  buildCaptainOrVice(
                    isCaptain: true,
                      allPlayers: allPlayers,
                      playerPosition: MyRes.kGoalKepper1,
                      myMapOfPlayersName: myMapOfPlayersName,
                      listOfFantasyPlayers: listOfFantasyPlayers));
      
      
          
      
              // await sl<ShowTeamProvider>().fetchTeams();
              // sl<ShowTeamProvider>().showTeam.forEach(
              //   (element) {
              //     print(
              //         " | ${getPlayerName(allPlayers, element.playerId!)} | => Playing in  ${element.playingInGameweeks} + Captain ${element.captain} + ViceCaptain ${element.viceCaptain}  + ${element.playerId} ");
              //   },
              // );
            },
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            buildPlayerIcon(
              myTshirtMap: myTshirtMap,
              context: context,
              playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                  myMapOfPlayersName, MyRes.kDefenders[0]),
              playerPosition: MyRes.kDefenders[0],
              isItBenched: "No",
              onTap: () {
                navigateToPlayerCard(
                    context,
                    allPlayers,
                    listOfFantasyPlayers,
                    myMapOfPlayersName,
                    myTshirtMap,
                    MyRes.kDefenders[0],
                    S.of(context).Defender,
                  buildCaptainOrVice  (
                    isCaptain: true,
                        allPlayers: allPlayers,
                        playerPosition: MyRes.kDefenders[0],
                        myMapOfPlayersName: myMapOfPlayersName,
                        listOfFantasyPlayers: listOfFantasyPlayers));
              },
            ),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kDefenders[1],
                      S.of(context).Defender,
                     buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kDefenders[1],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kDefenders[1]),
                playerPosition: MyRes.kDefenders[1],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kDefenders[2],
                      S.of(context).Defender,
                     buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kDefenders[2],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kDefenders[2]),
                playerPosition: MyRes.kDefenders[2],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kDefenders[3],
                      S.of(context).Defender,
                    buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kDefenders[3],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kDefenders[3]),
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
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kMidfielders[0],
                      S.of(context).Midfildier,
                        buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kMidfielders[0],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kMidfielders[0]),
                playerPosition: MyRes.kMidfielders[0],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kMidfielders[1],
                      S.of(context).Midfildier,
                    buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kMidfielders[1],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kMidfielders[1]),
                playerPosition: MyRes.kMidfielders[1],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kMidfielders[2],
                      S.of(context).Midfildier,
             buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kMidfielders[2],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kMidfielders[2]),
                playerPosition: MyRes.kMidfielders[2],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kMidfielders[3],
                      S.of(context).Midfildier,
                     buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kMidfielders[3],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kMidfielders[3]),
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
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kForwards[0],
                      S.of(context).Forward,
                      buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kForwards[0],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kForwards[0]),
                playerPosition: MyRes.kForwards[0],
                isItBenched: "No"),
            buildPlayerIcon(
                onTap: () {
                  navigateToPlayerCard(
                      context,
                      allPlayers,
                      listOfFantasyPlayers,
                      myMapOfPlayersName,
                      myTshirtMap,
                      MyRes.kForwards[1],
                      S.of(context).Forward,
                   buildCaptainOrVice  (
                    isCaptain: true,
                          allPlayers: allPlayers,
                          playerPosition: MyRes.kForwards[1],
                          myMapOfPlayersName: myMapOfPlayersName,
                          listOfFantasyPlayers: listOfFantasyPlayers));
                },
                myTshirtMap: myTshirtMap,
                context: context,
                playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                    myMapOfPlayersName, MyRes.kForwards[1]),
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
                    playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                        myMapOfPlayersName, "bench1"),
                    playerPosition: "bench1",
                    isItBenched: "Yes",
                    onTap: () async {},
                  ),
                  buildBenchedPlayerIcon(
                    myTshirtMap: myTshirtMap,
                    context: context,
                    playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                        myMapOfPlayersName, "bench2"),
                    playerPosition: "bench2",
                    isItBenched: "Yes",
                    onTap: () async {},
                  ),
                  buildBenchedPlayerIcon(
                    myTshirtMap: myTshirtMap,
                    context: context,
                    playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                        myMapOfPlayersName, "bench3"),
                    playerPosition: "bench3",
                    isItBenched: "Yes",
                    onTap: () async {},
                  ),
                  buildBenchedPlayerIcon(
                    myTshirtMap: myTshirtMap,
                    context: context,
                    playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
                        myMapOfPlayersName, "bench4"),
                    playerPosition: "bench4",
                    isItBenched: "Yes",
                    onTap: () async {},
                  ),
                ]),
              ],
            ),
          ),
        ],
      );
                    }}
    
  









// setCaptainIcon ({required List<Player> allPlayers,required List<ShowTeam> listOfFantasyPlayers,required Map<String, dynamic> myMapOfPlayersName,required Map<String, dynamic> myTshirtMap,required List<bool> isCaptainList}){
//  for (int i = 0; i < MyRes.kAllPlayersPositions.length; i++) {
//       isCaptainList[i] = showIsCaptain(
//           allPlayers: allPlayers,
//           playerPosition: MyRes.kAllPlayersPositions[i],
//           myMapOfPlayersName: myMapOfPlayersName,
//           listOfFantasyPlayers: listOfFantasyPlayers);
//     }

//     isCaptainList.map((element) {
//       print("isCaptainList: $element");
//     });

