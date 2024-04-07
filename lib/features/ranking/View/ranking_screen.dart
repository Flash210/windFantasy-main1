import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/features/ranking/ViewModel/ranking_provider.dart';
import 'package:provider/provider.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch user rank when the screen is initialized
    Provider.of<RankingProvider>(context, listen: false).fetchUserRank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking Screen'),
      ),
      body: Stack(
        children: [
          // Your main content here
          Container(
              // Your main content container
              ),
          // Ranking icon with text
          Positioned(
            top: 16, // Adjust top position as needed
            right: 16, // Adjust right position as needed
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                //color: Color.fromARGB(255, 179, 204, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Consumer<RankingProvider>(
                builder: (context, rankingProvider, _) {
                  if (rankingProvider.userRank != null) {
                    return Row(
                      children: [
                        // Lottie.asset(
                        //   'assets/coin.json',
                        //   width: 60,
                        //   height: 60,
                        // ),
                        Image.asset(
                          "assets/ranking.png",
                          width: 30,
                          height: 30,
                        ),
                        MyCustomText(
                          text:
                              " ${rankingProvider.userRank!.rank} /${rankingProvider.userRank!.numberOfUser} ",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
