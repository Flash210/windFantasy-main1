import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fixtures/View/fixtures_screen.dart';
import 'package:front/features/home%20screen/View/profilee_screen.dart';
import 'package:front/features/gameweek%20dashbord/View/game_week_dashbord.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Homey extends StatefulWidget {
  const Homey({super.key});

  static const routeName = '/home';

  @override
  State<Homey> createState() => _HomeyState();
}

class _HomeyState extends State<Homey> {
  int currentIndex = 0;

  final List<Widget> pages = [
    //FantasyScreen(),
    GameWeekDashboard(),
        const FixturesScreen(),

    //const RankingScreen(),

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
        bottomNavigationBar: buildNavigationButton(context));
    //buildNavigationButton(context));
  }

  SalomonBottomBar buildNavigationButton(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      items: [
        buildSalomonBottomItem(
          text: "Home",
          textColor: MyColors.kSecondaryColor,
          icon: Icons.stacked_bar_chart,
          selectedColor: MyColors.kSecondaryColor,
        ),

        // buildSalomonBottomItem(text: "Fixtures",
        //     textColor: const Color(0xFF3CCF4E),
        //     icon: Icons.stacked_bar_chart,
        //     selectedColor: const Color(0xFF3CCF4E)),

        // SalomonBottomBarItem(
        //   icon: const Icon(Icons.receipt, size: 30, color: MyColors.kPrimaryColor),
        //   title: const MyCustomText(text:  "Fixtures"),
        //   selectedColor: MyColors.kPrimaryColor,
        // ),

        buildSalomonBottomItem(
          text: "Fixture",
          textColor: MyColors.kSecondaryColor,
          icon: Icons.sports_soccer,
          selectedColor: MyColors.kSecondaryColor,
        ),

        buildSalomonBottomItem(
          text: "Profile",
          textColor: MyColors.kSecondaryColor,
          icon: Icons.person,
          selectedColor: MyColors.kSecondaryColor,
        ),
      ],
    );
  }

  buildSalomonBottomItem(
      {required String text,
      required Color textColor,
      required IconData icon,
      required Color selectedColor}) {
    return SalomonBottomBarItem(
      icon: Icon(icon, color: textColor),
      title: MyCustomText(text: text, style: TextStyle(color: textColor)),
      selectedColor: selectedColor,
    );
  }
}
