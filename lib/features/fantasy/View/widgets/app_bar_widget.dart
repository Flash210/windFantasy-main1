import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';




  Container buildAppBard(BuildContext context, {required int playerSelected}) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 5, left: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [MyColors.kSecondaryColor, Colors.white],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 11),
                children: [
                  TextSpan(text: S.of(context).TeamName),
                  TextSpan(
                    text: " " + sl<AuthProvider>().userDataa!.teamName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // width: ScreenUtils.getWidth(context) * 0.3,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const MyCustomText(
                    text: "Budget:",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    )),
                Consumer<PlayerProvider>(
                  builder: (context, playerProvider, _) {
                    return MyCustomText(
                      text: playerSelected != 15
                          ? "${playerProvider.amount} \$"
                          : sl<AuthProvider>().userDataa!.bank.toString() +
                              " \$",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }