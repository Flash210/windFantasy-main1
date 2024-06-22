import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/widgets/player_icon.dart';
import 'package:front/features/fantasy/Controller/show_team_provider.dart';
import 'package:front/features/player%20card/functions/player_statistics.dart';
import 'package:front/features/show%20team/Functions/commun_functions.dart';
import 'package:front/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShowFantasyTeam extends StatefulWidget {
  final List<Player> allPlayers;
  List<ShowTeam> listOfFantasyPlayers;
  final Map<String, dynamic> myMapOfPlayersName;
  final Map<String, dynamic> myTshirtMap;

  ShowFantasyTeam(
      {super.key,
      required this.allPlayers,
      required this.listOfFantasyPlayers,
      required this.myMapOfPlayersName,
      required this.myTshirtMap});

  @override
  State<ShowFantasyTeam> createState() => _ShowFantasyTeamState();
}

class _ShowFantasyTeamState extends State<ShowFantasyTeam> {
  //late final List<bool> isCaptainList;
  Map<String, dynamic> retrievedMap = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySizedBox(
          height: ScreenUtils.getHeight(context) * 0.02,
        ),

        // ! Goal Keeper  ***************
        buildPlayerIcon(
          onLongPress: () {
            navigateToPlayerCard(
              context,
              widget.allPlayers,
              widget.listOfFantasyPlayers,
              widget.myMapOfPlayersName,
              widget.myTshirtMap,
              MyRes.kGoalKepper1,
              S.of(context).GoalKepper,
              buildCaptainOrVice(
                  isCaptain: true,
                  allPlayers: widget.allPlayers,
                  playerPosition: MyRes.kGoalKepper1,
                  myMapOfPlayersName: widget.myMapOfPlayersName,
                  listOfFantasyPlayers: widget.listOfFantasyPlayers),
              buildCaptainOrVice(
                  isCaptain: false,
                  allPlayers: widget.allPlayers,
                  playerPosition: MyRes.kGoalKepper1,
                  myMapOfPlayersName: widget.myMapOfPlayersName,
                  listOfFantasyPlayers: widget.listOfFantasyPlayers),
            );
          },
          myTshirtMap: widget.myTshirtMap,
          context: context,
          playerName: getTextToShow(widget.listOfFantasyPlayers,
              widget.allPlayers, widget.myMapOfPlayersName, MyRes.kGoalKepper1),
          playerPosition: MyRes.kGoalKepper1,
          isItBenched: "No",
          onTap: () async {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: MyColors.kWhite,
              content: MyCustomText(
                text: getTextToShow(
                    widget.listOfFantasyPlayers,
                    widget.allPlayers,
                    widget.myMapOfPlayersName,
                    MyRes.kGoalKepper1),
                style: TextStyle(color: Colors.black),
              ),
            ));
            //13
            setPlayerInOrOutGameWeek(
                listOfFantasyPlayers: widget.listOfFantasyPlayers,
                numberOfPlayerInList: 13,
                inOrOut: false);
            addPlayerToSwitchList(
                listOfFantasyPlayers: widget.listOfFantasyPlayers,
                allPlayers: widget.allPlayers,
                myMapOfPlayersName: widget.myMapOfPlayersName,
                playerPosition: MyRes.kGoalKepper1);
            showAllPlayersDetails(allPlayers: widget.allPlayers);
          },
        ),

        // ! ********************************            Defenders  ********************************
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildPlayerIcon(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: MyColors.kWhite,
                content: MyCustomText(
                  text: getTextToShow(
                      widget.listOfFantasyPlayers,
                      widget.allPlayers,
                      widget.myMapOfPlayersName,
                      MyRes.kGoalKepper1),
                  style: TextStyle(color: Colors.black),
                ),
              ));
              setPlayerInOrOutGameWeek(
                  listOfFantasyPlayers: widget.listOfFantasyPlayers,
                  numberOfPlayerInList: 9,
                  inOrOut: false);
              addPlayerToSwitchList(
                  listOfFantasyPlayers: widget.listOfFantasyPlayers,
                  allPlayers: widget.allPlayers,
                  myMapOfPlayersName: widget.myMapOfPlayersName,
                  playerPosition: MyRes.kDefenders[0]);
            },
            myTshirtMap: widget.myTshirtMap,
            context: context,
            playerName: getTextToShow(
                widget.listOfFantasyPlayers,
                widget.allPlayers,
                widget.myMapOfPlayersName,
                MyRes.kDefenders[0]),
            playerPosition: MyRes.kDefenders[0],
            isItBenched: "No",
            onLongPress: () async {
              navigateToPlayerCard(
                  context,
                  widget.allPlayers,
                  widget.listOfFantasyPlayers,
                  widget.myMapOfPlayersName,
                  widget.myTshirtMap,
                  MyRes.kDefenders[0],
                  S.of(context).Defender,
                  buildCaptainOrVice(
                      isCaptain: true,
                      allPlayers: widget.allPlayers,
                      playerPosition: MyRes.kDefenders[0],
                      myMapOfPlayersName: widget.myMapOfPlayersName,
                      listOfFantasyPlayers: widget.listOfFantasyPlayers),
                  buildCaptainOrVice(
                      isCaptain: false,
                      allPlayers: widget.allPlayers,
                      playerPosition: MyRes.kDefenders[0],
                      myMapOfPlayersName: widget.myMapOfPlayersName,
                      listOfFantasyPlayers: widget.listOfFantasyPlayers));
            },
          ),

          //? -------------------------------------------------------
          buildPlayerIcon(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: MyColors.kWhite,
                content: MyCustomText(
                  text: getTextToShow(
                      widget.listOfFantasyPlayers,
                      widget.allPlayers,
                      widget.myMapOfPlayersName,
                      MyRes.kDefenders[1]),
                  style: TextStyle(color: Colors.black),
                ),
              ));
              setPlayerInOrOutGameWeek(
                  listOfFantasyPlayers: widget.listOfFantasyPlayers,
                  numberOfPlayerInList: 10,
                  inOrOut: false);
              addPlayerToSwitchList(
                  listOfFantasyPlayers: widget.listOfFantasyPlayers,
                  allPlayers: widget.allPlayers,
                  myMapOfPlayersName: widget.myMapOfPlayersName,
                  playerPosition: MyRes.kDefenders[1]);
            },
            myTshirtMap: widget.myTshirtMap,
            context: context,
            playerName: getTextToShow(
                widget.listOfFantasyPlayers,
                widget.allPlayers,
                widget.myMapOfPlayersName,
                MyRes.kDefenders[1]),
            playerPosition: MyRes.kDefenders[1],
            isItBenched: "No",
            onLongPress: () {
              navigateToPlayerCard(
                  context,
                  widget.allPlayers,
                  widget.listOfFantasyPlayers,
                  widget.myMapOfPlayersName,
                  widget.myTshirtMap,
                  MyRes.kDefenders[1],
                  S.of(context).Defender,
                  buildCaptainOrVice(
                      isCaptain: true,
                      allPlayers: widget.allPlayers,
                      playerPosition: MyRes.kDefenders[1],
                      myMapOfPlayersName: widget.myMapOfPlayersName,
                      listOfFantasyPlayers: widget.listOfFantasyPlayers),
                  buildCaptainOrVice(
                      isCaptain: false,
                      allPlayers: widget.allPlayers,
                      playerPosition: MyRes.kDefenders[1],
                      myMapOfPlayersName: widget.myMapOfPlayersName,
                      listOfFantasyPlayers: widget.listOfFantasyPlayers));
            },
          ),

          //? --------------------------
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kDefenders[2]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 11,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kDefenders[2]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kDefenders[2],
                    S.of(context).Defender,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kDefenders[2],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kDefenders[2],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kDefenders[2]),
              playerPosition: MyRes.kDefenders[2],
              isItBenched: "No"),

          //? ------------------------
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kDefenders[3]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 12,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kDefenders[3]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kDefenders[3],
                    S.of(context).Defender,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kDefenders[3],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kDefenders[3],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kDefenders[3]),
              playerPosition: MyRes.kDefenders[3],
              isItBenched: "No"),
        ]),
        // ! ******************** Midfildiers ***********************
        const SizedBox(height: 30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kMidfielders[0]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 4,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kMidfielders[0]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kMidfielders[0],
                    S.of(context).Midfildier,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[0],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[0],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kMidfielders[0]),
              playerPosition: MyRes.kMidfielders[0],
              isItBenched: "No"),

          //? --------------------------------------------------
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kMidfielders[1]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 5,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kMidfielders[1]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kMidfielders[1],
                    S.of(context).Midfildier,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[1],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[1],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kMidfielders[1]),
              playerPosition: MyRes.kMidfielders[1],
              isItBenched: "No"),

          //? --------------------------------------------------

          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kMidfielders[2]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 6,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kMidfielders[2]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kMidfielders[2],
                    S.of(context).Midfildier,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[2],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[2],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kMidfielders[2]),
              playerPosition: MyRes.kMidfielders[2],
              isItBenched: "No"),

          //? --------------------------------------------------

          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kMidfielders[3]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 7,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kMidfielders[3]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kMidfielders[3],
                    S.of(context).Midfildier,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[3],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kMidfielders[3],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kMidfielders[3]),
              playerPosition: MyRes.kMidfielders[3],
              isItBenched: "No"),
        ]),
        MySizedBox(height: ScreenUtils.getHeight(context) * 0.06),

        //! ************************** Forwards****************
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kForwards[0]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 0,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kForwards[0]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kForwards[0],
                    S.of(context).Forward,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kForwards[0],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kForwards[0],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kForwards[0]),
              playerPosition: MyRes.kForwards[0],
              isItBenched: "No"),
          buildPlayerIcon(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: MyColors.kWhite,
                  content: MyCustomText(
                    text: getTextToShow(
                        widget.listOfFantasyPlayers,
                        widget.allPlayers,
                        widget.myMapOfPlayersName,
                        MyRes.kForwards[1]),
                    style: TextStyle(color: Colors.black),
                  ),
                ));
                setPlayerInOrOutGameWeek(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    numberOfPlayerInList: 2,
                    inOrOut: false);
                addPlayerToSwitchList(
                    listOfFantasyPlayers: widget.listOfFantasyPlayers,
                    allPlayers: widget.allPlayers,
                    myMapOfPlayersName: widget.myMapOfPlayersName,
                    playerPosition: MyRes.kForwards[1]);
              },
              onLongPress: () {
                navigateToPlayerCard(
                    context,
                    widget.allPlayers,
                    widget.listOfFantasyPlayers,
                    widget.myMapOfPlayersName,
                    widget.myTshirtMap,
                    MyRes.kForwards[1],
                    S.of(context).Forward,
                    buildCaptainOrVice(
                        isCaptain: true,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kForwards[1],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers),
                    buildCaptainOrVice(
                        isCaptain: false,
                        allPlayers: widget.allPlayers,
                        playerPosition: MyRes.kForwards[1],
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        listOfFantasyPlayers: widget.listOfFantasyPlayers));
              },
              myTshirtMap: widget.myTshirtMap,
              context: context,
              playerName: getTextToShow(
                  widget.listOfFantasyPlayers,
                  widget.allPlayers,
                  widget.myMapOfPlayersName,
                  MyRes.kForwards[1]),
              playerPosition: MyRes.kForwards[1],
              isItBenched: "No"),
        ]),
        const SizedBox(height: 30),
        const SizedBox(height: 30),

        // ! *****************************  Benched *************************
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: MyColors.greyF,
          ),
          width: 300,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {},
                    icon: Image.asset(
                      "assets/Cswitch.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text('Benched Players',
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  Consumer<ShowTeamProvider>(
                    builder: (context, value, child) => IconButton(
                      onPressed: () async {
                        //retrievedMap = await sl<TokenManager>().getMap();
                        retrievedMap =
                            await sl<AuthProvider>().getMapDataPlayers();

                        List<String> listOfSwitch =
                            sl<ShowTeamProvider>().listOfSwitch;
                        retrievedMap[listOfSwitch[0]] = listOfSwitch[3];
                        retrievedMap[listOfSwitch[2]] = listOfSwitch[1];

                        sl<ShowTeamProvider>().resetSwitchList();
                        //  sl<TokenManager>() .savePlayerPositionToMap(map: retrievedMap);
                        //  Map<String,String> player=retrievedMap
                        Map<String, String> stringMap = retrievedMap.map(
                            (key, value) => MapEntry(key, value.toString()));

                        await sl<AuthProvider>().addMap(stringMap);

                        sl<ShowTeamProvider>().resetSwitchList();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: MyColors.kWhite,
                          content: MyCustomText(
                            text: "Players Switched :)",
                            style: TextStyle(color: Colors.black),
                          ),
                        ));
                        // await value.fetchTeams();
                        setState(() async {
                          widget.listOfFantasyPlayers =
                              await sl<ShowTeamProvider>().fetchTeams();
                          print("sycn -----------------");
                        });

                        // setState(() async{
                        //   listOfFantasyPlayers=await sl<ShowTeamProvider>().fetchTeams();
                        // });
                      },
                      icon: Image.asset(
                        "assets/switch.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildBenchedPlayerIcon(
                  myTshirtMap: widget.myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      widget.listOfFantasyPlayers,
                      widget.allPlayers,
                      widget.myMapOfPlayersName,
                      MyRes.kBencheds[0]),
                  playerPosition: "A0",
                  isItBenched: "Yes",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: MyColors.kWhite,
                      content: MyCustomText(
                        text: getTextToShow(
                            widget.listOfFantasyPlayers,
                            widget.allPlayers,
                            widget.myMapOfPlayersName,
                            MyRes.kBencheds[0]),
                        style: TextStyle(color: Colors.black),
                      ),
                    ));
                    setPlayerInOrOutGameWeek(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        numberOfPlayerInList: 1,
                        inOrOut: true);
                    addPlayerToSwitchList(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        allPlayers: widget.allPlayers,
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        playerPosition: MyRes.kBencheds[0]);
                  },
                ),
                buildBenchedPlayerIcon(
                  myTshirtMap: widget.myTshirtMap,
                  context: context,
                  playerName: getTextToShow(widget.listOfFantasyPlayers,
                      widget.allPlayers, widget.myMapOfPlayersName, "bench2"),
                  playerPosition: "M",
                  isItBenched: "Yes",
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: MyColors.kWhite,
                      content: MyCustomText(
                        text: getTextToShow(
                            widget.listOfFantasyPlayers,
                            widget.allPlayers,
                            widget.myMapOfPlayersName,
                            MyRes.kBencheds[1]),
                        style: TextStyle(color: Colors.black),
                      ),
                    ));
                    setPlayerInOrOutGameWeek(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        numberOfPlayerInList: 3,
                        inOrOut: true);
                    addPlayerToSwitchList(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        allPlayers: widget.allPlayers,
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        playerPosition: MyRes.kBencheds[1]);
                  },
                ),
                buildBenchedPlayerIcon(
                  myTshirtMap: widget.myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      widget.listOfFantasyPlayers,
                      widget.allPlayers,
                      widget.myMapOfPlayersName,
                      MyRes.kBencheds[2]),
                  playerPosition: "D",
                  isItBenched: "Yes",
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: MyColors.kWhite,
                      content: MyCustomText(
                        text: getTextToShow(
                            widget.listOfFantasyPlayers,
                            widget.allPlayers,
                            widget.myMapOfPlayersName,
                            MyRes.kBencheds[2]),
                        style: TextStyle(color: Colors.black),
                      ),
                    ));
                    setPlayerInOrOutGameWeek(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        numberOfPlayerInList: 8,
                        inOrOut: true);
                    addPlayerToSwitchList(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        allPlayers: widget.allPlayers,
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        playerPosition: MyRes.kBencheds[2]);
                  },
                ),
                buildBenchedPlayerIcon(
                  myTshirtMap: widget.myTshirtMap,
                  context: context,
                  playerName: getTextToShow(
                      widget.listOfFantasyPlayers,
                      widget.allPlayers,
                      widget.myMapOfPlayersName,
                      MyRes.kBencheds[3]),
                  playerPosition: "G",
                  isItBenched: "Yes",
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: MyColors.kWhite,
                      content: MyCustomText(
                        text: getTextToShow(
                            widget.listOfFantasyPlayers,
                            widget.allPlayers,
                            widget.myMapOfPlayersName,
                            MyRes.kBencheds[3]),
                        style: TextStyle(color: Colors.black),
                      ),
                    ));
                    //bench 4
                    //14
                    setPlayerInOrOutGameWeek(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        numberOfPlayerInList: 14,
                        inOrOut: true);
                    addPlayerToSwitchList(
                        listOfFantasyPlayers: widget.listOfFantasyPlayers,
                        allPlayers: widget.allPlayers,
                        myMapOfPlayersName: widget.myMapOfPlayersName,
                        playerPosition: MyRes.kBencheds[3]);
                  },
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
