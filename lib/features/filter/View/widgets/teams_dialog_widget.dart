import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/filter/Controller/filter_provider.dart';
import 'package:provider/provider.dart';

Future<void> showTeamDialog(BuildContext context, List<Team> teams,
    {required String position}) async {
  List<bool> isSelectedList = List.generate(teams.length, (_) => false);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          surfaceTintColor: const Color(0xFFF5FAF8),
          title: const Text('Select Teams'),
          content: SingleChildScrollView(
            child: SizedBox(
                height: 400,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: teams.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of items per row
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final team = teams[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedList[index] = !isSelectedList[index];
                        });
                        // ! add selected team to a  provider list
                        sl<FilterProvider>().showIcon(value: true);
                        sl<FilterProvider>().fillListTeamF(team);

                        sl<FilterProvider>()
                            .filterPlayerByTeamsF(position: position);
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF52C3BB),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          NetworkImage(team.logo.toString()),
                                    ),
                                    AutoSizeText(
                                      team.name.toString(),
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelectedList[index])
                                Positioned(
                                  top: 0,
                                  right: -2,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),

          // !                 reset and OK

          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF52C3BB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: const MyCustomText(
                          text: "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                TextButton(
                  child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF52C3BB), width: 1)),
                      child: Center(
                        child: const MyCustomText(
                          text: "Reset",
                          style: TextStyle(color: Color(0xFF52C3BB)),
                        ),
                      )),
                  onPressed: () {
                    sl<FilterProvider>().resetListsF();
                  },
                ),

                // TextButton(
                //   child: const Text('Reset'),
                //   onPressed: () {
                //     sl<FilterProvider>().resetListsF();
                //   },
                // ),
              ],
            ),
          ],
        );
      });
    },
  );
}
