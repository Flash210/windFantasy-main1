import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/team_edit.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';

void submit(
    List<int> forwards,
    List<int> midfielders,
    List<int> defenders,
    List<int> goalkeepers,
    int moneyRemaining,
    int playersSelected,
    String? token,
    BuildContext context) {
  if (forwards.contains(0) ||
      midfielders.contains(0) ||
      defenders.contains(0) ||
      goalkeepers.contains(0) ||
      forwards.length != 4 ||
      midfielders.length != 6 ||
      defenders.length != 4 ||
      goalkeepers.length != 1) {
    // awesomeDialog(
    //     context: context,
    //     text: "Team Miss players",
    //     type: DialogType.error,
    //     showRed: true);
  } else {
    sl<TeamEditProvider>()
        .createUserTeam(
            TeamEdit(
              forwards: forwards,
              midfielders: midfielders,
              defenders: defenders,
              goalkeepers: goalkeepers,
              moneyRemaining: 50,
              playersSelected: 15,
            ),
            token);
        // .then((value) => awesomeDialog(
        //         context: context,
        //         text: "Team Created Successfully",
        //         type: DialogType.success,
        //         showRed: false)
        //     .catchError((value) => awesomeDialog(
        //         context: context,
        //         text: "Team Creation Failed",
        //         type: DialogType.error,
        //         showRed: true)));
  }
  sl<TeamEditProvider>().changeIsCreatedState(true);

  // Future.delayed(const Duration(seconds: 2), () async {
  //   sl<TeamEditProvider>().changeIsCreatedState(false);
  //   var ch = await sl<TokenManager>().getUserId();
  //   var id =
  //       ch != null ? int.tryParse(ch) ?? 0 : 0; // Parse the String into an int
  //   Logger logger = Logger();
  //   logger.i("user id is $id");

  //   sl<TeamEditProvider>().showTeamAftercreation(id);
  // });
}
