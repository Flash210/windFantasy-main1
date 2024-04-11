import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/features/fantasy/functions/edit_team_functions.dart';

buildPlayerIcon(
    {required String playerName,
    required String playerPosition,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap}) {
  Column(
    children: [
      GestureDetector(
        onDoubleTap: onDoubleTap,
        onTap: onTap,
        child: Image.asset(
          "assets/whiteKit.png",
          width: 40,
          height: 40,
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(7)),
          color: Colors.black,
        ),
        child: AutoSizeText(
          maxLines: 1,
          overflow: TextOverflow.visible,
          maxFontSize: 13,
          minFontSize: 8,
          extractLastName(playerName),
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
              bottomRight: Radius.circular(10), bottomLeft: Radius.circular(7)),
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
  );
}
