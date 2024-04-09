import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fantasy/View/test.dart';
import 'package:front/features/fixtures/View/fixtures_screen.dart';
import 'package:front/features/home%20screen/View/profilee_screen.dart';
import 'package:front/features/home%20screen/View/fantasy_global_screen.dart';
import 'package:front/features/ranking/View/ranking_screen.dart';

class Homey extends StatefulWidget {
  const Homey({super.key});

  static const routeName = '/home';

  @override
  State<Homey> createState() => _HomeyState();
}

class _HomeyState extends State<Homey> {
  int currentIndex = 0;

  final List<Widget> pages = [
    // const FixturesScreen(),
    Testt(),
    const RankingScreen(),
    const StatisticScreen(),
    const ProfileScreeen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: buildNavigationButton(context),
    );
  }

  CurvedNavigationBar buildNavigationButton(BuildContext context) {
    return CurvedNavigationBar(
      color: MyColors.kSecondaryColor,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      backgroundColor: MyColors.kWhite,
      items: [
        const CurvedNavigationBarItem(
            child: Icon(
          Icons.home,
          size: 30,
          color: MyColors.kWhite,
        )),
        const CurvedNavigationBarItem(
            child: Icon(
          Icons.stadium_rounded,
          size: 30,
          color: MyColors.kWhite,
        )),
        CurvedNavigationBarItem(
            child: Image.asset(
          'assets/stat.png',
          width: 20,
          height: 20,
          color: MyColors.kWhite,
        )),
        const CurvedNavigationBarItem(
          child: Icon(
            Icons.person,
            color: MyColors.kWhite,
          ),
        ),
      ],
    );
  }
}
