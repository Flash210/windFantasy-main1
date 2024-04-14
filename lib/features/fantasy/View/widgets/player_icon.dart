import 'package:flutter/material.dart';
import 'package:front/core/common_widget/show_player_widget.dart';

GestureDetector buildPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    required BuildContext context
    }) {
  return GestureDetector(
    onDoubleTap: onDoubleTap,
    onTap: onTap,
    child: isItBenched == "No"
        ? buildPlayerContainer(
            playerName: playerName,
            playerPosition: playerPosition,
            teamName: "anonymTeam", context:context)
        : buildbenchedPlayerContainer(playerName :playerName,teamName: "anonymTeam",context:context ),
  );
}

Column buildBenchedPlayerIcon(
    {required String playerName,
    required String playerPosition,
    required String isItBenched,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    required BuildContext context
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildPlayerIcon(
          playerName: playerName,
          playerPosition: playerPosition,
          onDoubleTap: onDoubleTap,
          onTap: onTap,
          isItBenched: isItBenched,
          context: context
          )
    ],
  );
}
