import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_page_route.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/home%20screen/View/widgets/custom_app_bar.dart';
import 'package:front/features/home%20screen/View/widgets/list_title_widget.dart';
import 'package:front/features/splash%20screen/splash_screen.dart';
import 'package:front/features/splash%20screen/widgets/langauge_bottom_sheet.dart';
import 'package:front/generated/l10n.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({super.key});

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('Profile'),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/ball.jpg'),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildListTile(Icons.person_2, S.of(context).PersonalInfo,
                      onTap: () {
                    Navigator.pushNamed(context, MyRes.kEditProfile);
                  }),
                  // buildListTile(Icons.notification_add, S.of(context).Notif),
                  // SwitchExample(),
                  buildListTile(Icons.language, S.of(context).Langue,
                      onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => const LanguageBottomSheet(),
                    );
                  }),

                  buildListTile(Icons.logout_rounded, S.of(context).LogOut,
                      onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 100,
                             color: Colors.white,
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          sl<TokenManager>().clearToken();
                                         // sl<TokenManager>().clearMap();

                                          // Navigator.pushNamedAndRemoveUntil(
                                          //     context,
                                          //     MyRes.kSignIn,
                                          //     (route) => false);
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            CustomPageRoute(
                                              builder: (context) =>
                                                  const SplashScreen(),
                                              fromBottom: true,
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        child: const Icon(
                                            Icons.check_circle_rounded,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  MyCustomText(text: S.of(context).AreYouSure),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
