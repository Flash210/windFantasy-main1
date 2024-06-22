import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/card_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerViewStat extends StatelessWidget {
  final Player player;
  final String teamTshirt;
  final String teamName;
  const PlayerViewStat(
      {super.key,
      required this.player,
      required this.teamTshirt,
      required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(240, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 3,
          surfaceTintColor: Colors.black,
          foregroundColor: Colors.black,
          title: MyCustomText(
            text: teamName,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildParallelogrameShape2(
                  // teamName: teamName,
                  teamTshirt: teamTshirt,
                  playerName: player.name,
                  position: player.position,
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.1),
              buildPlayerStatistic1(
                  matchPlayed: player.totalMatchesPlayed.toString(),
                  manOfMatch: player.totalManOfTheMatch.toString(),
                  goals: player.totalGoals.toString(),
                  points: player.totalPoints.toString(),
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildPlayerStatistic2(
                  assits: player.totalAssists.toString(),
                  redCart: player.totalRedCard.toString(),
                  yellowCart: player.totalYellowCard.toString(),
                  ownGoals: player.totalOwnGoals.toString(),
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.015),
              buildPlayerStatistic3(
                  missedPenalties: player.totalMissedPenalties.toString(),
                  cleanSHeet: player.totalCleanSheet.toString(),
                  context: context),
              MySizedBox(height: ScreenUtils.getHeight(context) * 0.05),
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
      {required String assits,
      required String redCart,
      required String yellowCart,
      required String ownGoals,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerStatisticShape(
            statisticValue: assits, statisticName: "Assists", context: context),
        buildPlayerStatisticShape(
            statisticValue: redCart,
            statisticName: "Red Cart",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: yellowCart,
            statisticName: "Yellow Cart",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: ownGoals,
            statisticName: "Own Goals",
            context: context)
      ],
    );
  }

  Row buildPlayerStatistic3(
      {required String missedPenalties,
      required String cleanSHeet,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerStatisticShape(
            statisticValue: missedPenalties,
            statisticName: "Missed Penalties",
            context: context),
        buildPlayerStatisticShape(
            statisticValue: cleanSHeet,
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
}
