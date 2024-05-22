import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

class ShowAllTeams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.1,
        title: const MyCustomText(
          text: 'Teams',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PlayerProvider>(
              builder: (context, playerProvider, _) {
                if (playerProvider.teams.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // return ListView.builder(
                  //   itemCount: playerProvider.teams.length,
                  //   itemBuilder: (context, index) {
                  //     final team = playerProvider.teams[index];
                  //     return ListTile(
                  //       leading: CircleAvatar(
                  //         backgroundImage: NetworkImage(team.logo.toString()),
                  //       ),
                  //       title: Text(team.name.toString()),

                  //       // Add more ListTile properties as needed
                  //     );
                  //   },
                  // );
                  return GridView.builder(
                    itemCount: playerProvider.teams.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of items per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final team = playerProvider.teams[index];

                      return Column(
                        children: [
                          SizedBox(
                            height: ScreenUtils.getHeight(context) * 0.020,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 2),
                            width: 70,
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
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            child: Image.asset(
              'assets/se.png',
            ),
          )
        ],
      ),
    );
  }
}
