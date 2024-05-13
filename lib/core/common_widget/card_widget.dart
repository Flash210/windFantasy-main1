  import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/player%20card/widgets/pal_shape.dart';
import 'package:front/generated/l10n.dart';

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


  RichText buildRichText(
    {required String textSpan, required String textSpnaValue}) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.white, fontSize: 11),
      children: [
        TextSpan(text: textSpan),
        TextSpan(
          text: textSpnaValue,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}














ParallelogramShape buildParallelogrameShape2(
      {required String playerName,
      required String position,
      required BuildContext context,
      required String teamTshirt,
  }) {
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
                  
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

