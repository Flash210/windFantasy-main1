import 'package:flutter/material.dart';
import 'package:front/core/common_functions/extract_player_name.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';
import 'package:provider/provider.dart';

ListTile buildBottomSheetListTitle(Team team, Player player,
    BuildContext context, String positionPlayer, List<Player> listForFilter) {
  return ListTile(
    onTap: () {
      sl<TeamEditProvider>().saveTeamPlayerInfos(
          teamNameAttribute: team.name!,
          playerNameAtrribute: player.name,
          playerPrice: player.price);
      bool maxTeam = sl<TeamEditProvider>()
          .checkMaxTeam(teamName: team.name!, longPress: false);

      bool enoughMoeny = sl<PlayerProvider>()
          .amountSubstraction(value: player.price, longPress: false);

      if (enoughMoeny && maxTeam) {
        context
            .read<PlayerProvider>()
            .addSelectedPlayerToMap(position: positionPlayer, player: player);
            //! save player postion in shared storage
        sl<ShowTeamProvider>().fillSavePlayerListPostion(
            playerPosition: positionPlayer,
            playerName: extractLastName(player.name));
            //!
             final List<Team> teams = sl<PlayerProvider>().teams;
        final teamName = teams.firstWhere(
          (team) => team.id == player?.teamId,
          orElse: () => Team(
            id: 0,
            name: 'Unknown',
          ),
        );
            sl<ShowTeamProvider>().saveTeamShirtF(playerName: extractLastName(player.name), 
            teamShirt: getTeamShirtName(teamName: teamName.name!));



        Navigator.pop(context);
      } else {
        // Provider.of<TeamEditProvider>(context, listen: false)
        //     .fillTeamsAfterMaxReached(team);
        // Provider.of<TeamEditProvider>(context, listen: false)
        //     .fillPlayersMaxReached(player);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: maxTeam == false
                ? const MyCustomText(text: "Max team Selection reached ")
                : const MyCustomText(text: 'You don\'t have enough money'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context);
      }
      {}
    },
    leading: Image.network(team.logo!),
    title: buildPlayerPriceAndName(player),
    trailing: buildPlayerPostionWidgett(player),
  );
}

Container buildPlayerPostionWidgett(Player player) {
  return Container(
    alignment: Alignment.center,
    height: 30,
    width: 66,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: player.position == MyRes.kMidfilder
          ? Colors.blue
          : player.position == MyRes.kDefender
              ? Colors.green
              : player.position == MyRes.kForward
                  ? const Color.fromARGB(255, 138, 126, 21)
                  : Colors.red,
    ),
    child: MyCustomText(
      text: player.position,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Column buildPlayerPriceAndName(Player player) {
  return Column(
    children: [
      // Text(player.name),
      MyCustomText(text: extractLastName(player.name)),
      const SizedBox(width: 10),
      MyCustomText(
        text: '£${player.price}m',
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
