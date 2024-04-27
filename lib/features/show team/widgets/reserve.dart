// Column buildShowFantasyTeam(
//     {required BuildContext context,
//     required List<Player> allPlayers,
//     required List<ShowTeam> listOfFantasyPlayers,
//     required Map<String, dynamic> myMapOfPlayersName,
//     required Map<String, dynamic> myTshirtMap}) {
//   return Column(
//     children: [
//       MySizedBox(
//         height: ScreenUtils.getHeight(context) * 0.06,
//       ),
//       buildPlayerIcon(
//         myTshirtMap: myTshirtMap,
//         context: context,
//         playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//             myMapOfPlayersName, MyRes.kGoalKepper1),
//         playerPosition: MyRes.kGoalKepper1,
//         isItBenched: "No",
//         onTap: () async {
//           // showIsCaptain(allPlayers:allPlayers,playerPosition:"Gardien1", myMapOfPlayersName: myMapOfPlayersName,
//           //  listOfFantasyPlayers:listOfFantasyPlayers
//           //  );

//           // showIsCaptain(
//           //     allPlayers: allPlayers,
//           //     playerPosition: "Gardien1",
//           //     myMapOfPlayersName: myMapOfPlayersName,
//           //     listOfFantasyPlayers: listOfFantasyPlayers);

//                  navigateToPlayerCard(
//               context,
//               allPlayers,
//               listOfFantasyPlayers,
//               myMapOfPlayersName,
//               myTshirtMap,
//               MyRes.kGoalKepper1,
//               S.of(context).GoalKepper,
//                  showIsCaptain(
//               allPlayers: allPlayers,
//               playerPosition: "Gardien1",
//               myMapOfPlayersName: myMapOfPlayersName,
//               listOfFantasyPlayers: listOfFantasyPlayers)
//               );

              

//           // int playerId = allPlayers
//           //     .firstWhere(
//           //       (player) =>
//           //           myMapOfPlayersName["Gardien1"] ==
//           //           extractLastName(player.name),
//           //       orElse: () => Player.empty(),
//           //     )
//           //     .id;

//           // ShowTeam playerData = listOfFantasyPlayers
//           //     .firstWhere((element) => element.playerId == playerId);

//           // playerData.captain!.contains("34") ? print("34 Yes ") : print("34 No");

//           // Check if captain list is empty or has values
//           // String captainString = yup.captain!.first; // "[34]"
//           // List<dynamic> captainList =
//           //     json.decode(captainString); // Parse the string as a list

//           // if (captainList.isNotEmpty) {
//           //   if (captainList[0] == "34") {
//           //     print("First element in captain list matches '34'");
//           //   } else {
//           //     print("First element in captain list does not match '34'");
//           //   }
//           // } else {
//           //   print("Captain list is empty");
//           // }

// //print(yup.captain.equals([[34]]));  // This should print true

//           // await sl<ShowTeamProvider>().fetchTeams();
//           // sl<ShowTeamProvider>().showTeam.forEach(
//           //   (element) {
//           //     print(
//           //         " | ${getPlayerName(allPlayers, element.playerId!)} | => Playing in  ${element.playingInGameweeks} + Captain ${element.captain} + ViceCaptain ${element.viceCaptain}  + ${element.playerId} ");
//           //   },
//           // );

       
//         },
//       ),
//       const SizedBox(height: 15),
//       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         buildPlayerIcon(
//           myTshirtMap: myTshirtMap,
//           context: context,
//           playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//               myMapOfPlayersName, MyRes.kDefenders[0]),
//           playerPosition: MyRes.kDefenders[0],
//           isItBenched: "No",
//           onTap: () {
//             navigateToPlayerCard(
//                 context,
//                 allPlayers,
//                 listOfFantasyPlayers,
//                 myMapOfPlayersName,
//                 myTshirtMap,
//                 MyRes.kDefenders[0],
//                 S.of(context).Defender,
//                 showIsCaptain(allPlayers: allPlayers, 
//                 playerPosition:  MyRes.kDefenders[0] , myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
                
//                 );
//           },
//         ),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kDefenders[1],
//                   S.of(context).Defender,
//                   showIsCaptain(allPlayers: allPlayers, 
//                   playerPosition:  MyRes.kDefenders[1] , myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kDefenders[1]),
//             playerPosition: MyRes.kDefenders[1],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kDefenders[2],
//                   S.of(context).Defender,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition:  MyRes.kDefenders[2], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kDefenders[2]),
//             playerPosition: MyRes.kDefenders[2],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kDefenders[3],
//                   S.of(context).Defender,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition:  MyRes.kDefenders[3], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kDefenders[3]),
//             playerPosition: MyRes.kDefenders[3],
//             isItBenched: "No"),
//       ]),
//       const SizedBox(height: 30),
//       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kMidfielders[0],
//                   S.of(context).Midfildier,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kMidfielders[0], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kMidfielders[0]),
//             playerPosition: MyRes.kMidfielders[0],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kMidfielders[1],
//                   S.of(context).Midfildier,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kMidfielders[1], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kMidfielders[1]),
//             playerPosition: MyRes.kMidfielders[1],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kMidfielders[2],
//                   S.of(context).Midfildier,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kMidfielders[2], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kMidfielders[2]),
//             playerPosition: MyRes.kMidfielders[2],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kMidfielders[3],
//                   S.of(context).Midfildier,
//                    showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kMidfielders[3], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kMidfielders[3]),
//             playerPosition: MyRes.kMidfielders[3],
//             isItBenched: "No"),
//       ]),
//       const SizedBox(height: 30),
//       const SizedBox(height: 30),
//       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kForwards[0],
//                   S.of(context).Forward,
//                   showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kForwards[0], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kForwards[0]),
//             playerPosition: MyRes.kForwards[0],
//             isItBenched: "No"),
//         buildPlayerIcon(
//             onTap: () {
//               navigateToPlayerCard(
//                   context,
//                   allPlayers,
//                   listOfFantasyPlayers,
//                   myMapOfPlayersName,
//                   myTshirtMap,
//                   MyRes.kForwards[1],
//                   S.of(context).Forward,
                  
//                    showIsCaptain(allPlayers: allPlayers,
//                    playerPosition: MyRes.kForwards[1], myMapOfPlayersName: myMapOfPlayersName, listOfFantasyPlayers: listOfFantasyPlayers)
//                   );
//             },
//             myTshirtMap: myTshirtMap,
//             context: context,
//             playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                 myMapOfPlayersName, MyRes.kForwards[1]),
//             playerPosition: MyRes.kForwards[1],
//             isItBenched: "No"),
//       ]),
//       const SizedBox(height: 30),
//       const SizedBox(height: 30),
//       Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: MyColors.greyF,
//         ),
//         width: 300,
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Text('Benched Players',
//                 style: GoogleFonts.rubik(
//                   textStyle: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600),
//                 )),
//             const SizedBox(height: 16),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//               buildBenchedPlayerIcon(
//                 myTshirtMap: myTshirtMap,
//                 context: context,
//                 playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                     myMapOfPlayersName, "bench1"),
//                 playerPosition: "bench1",
//                 isItBenched: "Yes",
//                 onTap: () async {},
//               ),
//               buildBenchedPlayerIcon(
//                 myTshirtMap: myTshirtMap,
//                 context: context,
//                 playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                     myMapOfPlayersName, "bench2"),
//                 playerPosition: "bench2",
//                 isItBenched: "Yes",
//                 onTap: () async {},
//               ),
//               buildBenchedPlayerIcon(
//                 myTshirtMap: myTshirtMap,
//                 context: context,
//                 playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                     myMapOfPlayersName, "bench3"),
//                 playerPosition: "bench3",
//                 isItBenched: "Yes",
//                 onTap: () async {},
//               ),
//               buildBenchedPlayerIcon(
//                 myTshirtMap: myTshirtMap,
//                 context: context,
//                 playerName: getTextToShow(listOfFantasyPlayers, allPlayers,
//                     myMapOfPlayersName, "bench4"),
//                 playerPosition: "bench4",
//                 isItBenched: "Yes",
//                 onTap: () async {},
//               ),
//             ]),
//           ],
//         ),
//       ),
//     ],
//   );
// }


 