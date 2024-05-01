import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';

import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

class ShowAllPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Players'),
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, _) {
          if (playerProvider.players.isEmpty) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show loading indicator
          } else {
            return ListView.builder(
              itemCount: playerProvider.players.length,
              itemBuilder: (context, index) {
                final player = playerProvider.players[index];
                return ListTile(
                  title: MyCustomText(text: player.name),
                  subtitle: MyCustomText(text: player.position.toString()),
                  trailing: MyCustomText(text: "${player.price}\$"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
