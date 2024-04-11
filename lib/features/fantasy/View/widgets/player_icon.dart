import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector buildPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap}) {
  return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: isItBenched == "No"
          ? Column(
              children: [
                Image.asset(
                  isItBenched == "No"
                      ? "assets/whiteKit.png"
                      : "assets/greyKit.png",
                  width: 40,
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(7)),
                    color: Colors.black,
                  ),
                  child: AutoSizeText(
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    maxFontSize: 13,
                    minFontSize: 8,
                    playerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(7)),
                    color: Colors.white,
                  ),
                  child: AutoSizeText(
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    maxFontSize: 15,
                    minFontSize: 8,
                    playerPosition,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          : Column(children: [
              Image.asset(
                "assets/greyKit.png",
                width: 35,
                height: 40,
              ),
              AutoSizeText(
                playerName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              )
            ]));
}

Column buildBenchedPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildPlayerIcon(
          playerName: playerName,
          playerPosition: playerPosition,
          onDoubleTap: onDoubleTap,
          onTap: onTap,
          isItBenched: isItBenched)
    ],
  );
}
