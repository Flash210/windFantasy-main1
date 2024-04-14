import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/player%20card/View/pal_shape.dart';
import 'package:front/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final String position;
  final String teamTshirt;
  final String teamName;
  const PlayerCard(
      {super.key,
      required this.playerName,
      required this.position,
      required this.teamTshirt,
      required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(240, 255, 255, 255),
        appBar: AppBar(
          title: Center(child: MyCustomText(text: playerName)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildParallelogrameShape(
                  teamName: teamName,
                  teamTshirt: teamTshirt,
                  playerName: playerName,
                  position: position,
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.1),
              buildPlayerStatistic1(
                  matchPlayed: "0",
                  manOfMatch: "0",
                  goals: "0",
                  points: "0",
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildPlayerStatistic2(
                  matchPlayed: "0",
                  manOfMatch: "0",
                  goals: "0",
                  points: "0",
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildPlayerStatistic3(
                  matchPlayed: "0",
                  manOfMatch: "0",
                  goals: "0",
                  points: "0",
                  context: context),
            ],
          ),
        ));
  }

  Row buildPlayerStatistic1(
      {required String matchPlayed,
      required String manOfMatch,
      required String goals,
      required String points,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerStatisticShape(
            statisticValue: matchPlayed,
            statisticName: "Match Played",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: manOfMatch,
            statisticName: "Man Of Match",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: goals, statisticName: "Goals", context: context),
        buildPlayerStatisticShape(
            statisticValue: points, statisticName: "Points", context: context)
      ],
    );
  }

  Row buildPlayerStatistic2(
      {required String matchPlayed,
      required String manOfMatch,
      required String goals,
      required String points,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerStatisticShape(
            statisticValue: matchPlayed,
            statisticName: "Assists",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: manOfMatch,
            statisticName: "Red Cart",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: goals,
            statisticName: "Yellow Cart",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: points,
            statisticName: "Own Goals",
            context: context)
      ],
    );
  }

  Row buildPlayerStatistic3(
      {required String matchPlayed,
      required String manOfMatch,
      required String goals,
      required String points,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerStatisticShape(
            statisticValue: matchPlayed,
            statisticName: "Missed Penalties",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: manOfMatch,
            statisticName: "Clean Sheet",
            context: context),
      ],
    );
  }

  Container buildPlayerStatisticShape(
      {required String statisticName,
      required String statisticValue,
      required BuildContext context}) {
    return Container(
      width: ScreenUtils.getWidth(context) * 0.22,
      height: ScreenUtils.getHeight(context) * 0.1,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCustomText(
              text: statisticValue,
              style: GoogleFonts.libreBaskerville(
                textStyle: const TextStyle(
                  color: Color(0xFF5BBCFF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          AutoSizeText(
            maxLines: 1,
            overflow: TextOverflow.visible,
            maxFontSize: 13,
            minFontSize: 8,
            statisticName,
            style: const TextStyle(
              color: MyColors.kGrey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  ParallelogramShape buildParallelogrameShape(
      {required String playerName,
      required String position,
      required BuildContext context,
      required String teamTshirt,
      required String teamName}) {
    return ParallelogramShape(
      width: ScreenUtils.getWidth(context) * 0.9,
      height: ScreenUtils.getHeight(context) * 0.2,
      gradient: const LinearGradient(
        colors: [MyColors.kSecondaryColor, Colors.white],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  teamTshirt == "anonymTeam"
                      ? "assets/kits/anonymTeam.png"
                      : "assets/kits/$teamTshirt.png",
                  width: 80,
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRichText(
                        textSpan: S.of(context).NameOfPlayer,
                        textSpnaValue: playerName),
                    buildRichText(
                        textSpan: "Position: ", textSpnaValue: position),
                    buildRichText(
                        textSpan: S.of(context).Team1,
                        textSpnaValue:
                            getTeamShirtNameReversed(teamName: teamName)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
