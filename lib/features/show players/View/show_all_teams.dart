import 'package:flutter/material.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

class ShowAllTeams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Teams'),
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, _) {
          if (playerProvider.teams.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: playerProvider.teams.length,
              itemBuilder: (context, index) {
                final team = playerProvider.teams[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(team.logo.toString()),
                  ),
                  title: Text(team.name.toString()),

                  // Add more ListTile properties as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
