import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/filter/ViewModel/filter_provider.dart';

Future<void> showTeamDialog(BuildContext context, List<Team> teams) async {
  bool isSelected = false;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: const Text('Select Teams'),
          content: SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              // scrollDirection: Axis.horizontal,
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
                return ListTile(
                  leading: Image.network(team.logo ?? ''),
                  title: Text(team.name ?? ''),
                  onTap: () {
                    // ! add selected team to a  provider list

                    sl<FilterProvider>().fillListTeamF(team);

                    sl<FilterProvider>().filterPlayerByTeamsF();
                  },
                  // trailing: Checkbox(
                  //   value: isSelected,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       isSelected = value!;
                  //     });
                  //     sl<FilterProvider>().filterPlayerByTeamsF();
                  //     sl<FilterProvider>().filterPlayerByTeamsF();
                  //   },
                  // ),
                );
              },
            ),
          ),

          // !                 reset and OK

          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    sl<FilterProvider>().resetListsF();
                  },
                ),
              ],
            ),
          ],
        );
      });
    },
  );
}
