import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/filter/View/widgets/teams_dialog_widget.dart';
import 'package:front/features/filter/View/widgets/widgets.dart';
import 'package:front/features/filter/ViewModel/filter_provider.dart';
import 'package:front/features/filter/utils/functions2.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';

//! the bottom button witch will apply the 3 filters
Container buildApplyFilterBtn(
    {required String positon, required BuildContext context}) {
  return Container(
    margin: const EdgeInsets.only(top: 30.0),
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.all(10.0),
    width: ScreenUtils.getWidth(context) * 0.4,
    decoration: const BoxDecoration(
      color: MyColors.kSecondaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Consumer<FilterProvider>(builder: (context, provider, _) {
      return InkWell(
        onTap: () {
          provider.filterByThreeLists(provider.filteredPlayerByPosition,
              provider.filteredPlayerByTeams, provider.filteredPlayerByPrice,
              position: changePositonFrom(position: positon));
        },
        child: MyCustomText(
          text: provider.filtredByThreeLists.isNotEmpty
              ? "${S.of(context).Apply}  (${provider.filtredByThreeLists.length})"
              : S.of(context).Apply,
          textAlign: TextAlign.center,
          style: const TextStyle(color: MyColors.kWhite),
        ),
      );
    }),
  );
}

// ! the first filter by team

Container buildFilterByTeam(BuildContext context, {required String position}) {
  return Container(
    padding: const EdgeInsets.all(3.0),
    decoration: const BoxDecoration(
      color: MyColors.kWhite,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<FilterProvider>(builder: (context, provider, _) {
          return MyCustomText(
              text: provider.filteredPlayerByTeams.isNotEmpty
                  ? "${S.of(context).Team}  (${provider.filteredPlayerByTeams.length})"
                  : S.of(context).Team);
        }),
        IconButton(
            onPressed: () async {
              final List<Team> teams = await sl<PlayerProvider>().fetchTeams();
              showTeamDialog(context, teams,
                  position: changePositonFrom(position: position));
            },
            icon: const Icon(Icons.arrow_forward))
      ],
    ),
  );
}

Padding buildResetText({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, right: 30),
    child: InkWell(
      onTap: () => sl<FilterProvider>().resetListsF(),
      child: MyCustomText(
        text: S.of(context).Reset,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
      ),
    ),
  );
}

//*

Container builFilterByPositions({required position}) {
  return Container(
      decoration: const BoxDecoration(
        color: MyColors.kWhite,
      ),
      child: checkPositonFrom(position)
          ? Consumer<FilterProvider>(builder: (context, provider, _) {
              return Column(
                children: [
                  // ! ******** Stiker check Box ********

                  checkboxListTitleWidget(
                      title: S.of(context).Forward,
                      isPlayerSelected: provider.isStrikerSelected,
                      onChanged: (value) {
                        sl<FilterProvider>().filterPlayersByPosition(
                            MyRes.kForward, provider.isStrikerSelected);
                        provider.updateIsStrikerSelected(value!);
                      }),

                  // ! ********** Midfielder check Box **********
                  checkboxListTitleWidget(
                      title: S.of(context).Midfildier,
                      isPlayerSelected: provider.isMidfielderSelected,
                      onChanged: (value) {
                        sl<FilterProvider>().filterPlayersByPosition(
                            MyRes.kMidfilder, provider.isMidfielderSelected);
                        provider.updateIsMidfielderSelected(value!);
                      }),

                  // ! ********** Defender check Box **********
                  checkboxListTitleWidget(
                      title: S.of(context).Defender,
                      isPlayerSelected: provider.isDefenderSelected,
                      onChanged: (value) {
                        sl<FilterProvider>().filterPlayersByPosition(
                            MyRes.kDefender, provider.isDefenderSelected);
                        provider.updateIsDefenderSelected(value!);
                      }),

                  //! ******* GoalKepper box ******
                  checkboxListTitleWidget(
                      title: S.of(context).GoalKepper,
                      isPlayerSelected: provider.isGoalkeeperSelected,
                      onChanged: (value) {
                        sl<FilterProvider>().filterPlayersByPosition(
                            MyRes.kGoalKepper, provider.isGoalkeeperSelected);
                        provider.updateIsGoalkeeperSelected(value!);
                      }),
                ],
              );
            })
          : Container());
}

Container buildFilterByPrice({required String postion}) {
  return Container(
    decoration: const BoxDecoration(
      color: MyColors.kWhite,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyCustomText(
          text: "Price Range",
          textAlign: TextAlign.start,
        ),
        Consumer<FilterProvider>(builder: (context, provider, _) {
          return RangeSlider(
            overlayColor: MaterialStateProperty.all(Colors.green),
            activeColor: MyColors.kSecondaryColor,
            values: provider.values,
            min: 4,
            max: 12,
            divisions: 12 - 4,
            onChanged: (newValues) {
              provider.values = newValues;

              sl<FilterProvider>().filterPlayerByPriceF(
                  provider.values.start.toInt(), provider.values.end.toInt(),
                  position: changePositonFrom(position: postion));
            },
            labels: RangeLabels(
              provider.values.start.round().toString(),
              provider.values.end.round().toString(),
            ),
          );
        }),
        const SizedBox(height: 5.0),
      ],
    ),
  );
}
