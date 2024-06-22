import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/View/auth_screen.dart';
import 'package:front/features/entry%20point/entry_point.dart';
import 'package:front/features/fantasy/View/fantasy_screen.dart';
import 'package:front/features/home%20screen/View/edit_profile_screen.dart';
import 'package:front/features/home%20screen/View/on_boarding_home.dart';
import 'package:front/features/splash%20screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FutureBuilder(
            future: sl<TokenManager>().getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return const AuthenticationScreenT(
                    pageType: MyRes.kSignIn,
                  );;
                } else {
                  // Token doesn't exist, navigate to entry point screen
                  return const SplashScreen();
                }
              } else {
                // Token retrieval in progress, show loading indicator
                return const CircularProgressIndicator();
              }
            },
          ),
        );

      case MyRes.kSignIn:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationScreenT(pageType: MyRes.kSignIn),
        );

      case MyRes.kSignUpPage:
        return MaterialPageRoute(
          builder: (_) =>
              const AuthenticationScreenT(pageType: MyRes.kSignUpPage),
        );

      case MyRes.kEditProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );

      case MyRes.kFantasy:
        return MaterialPageRoute(
          builder: (_) => const FantasyScreen(),
        );

      case MyRes.kForgetPasswordPage:
        return MaterialPageRoute(
          builder: (_) =>
              const AuthenticationScreenT(pageType: MyRes.kForgetPasswordPage),
        );

      case MyRes.kResetPasswordPage:
        return MaterialPageRoute(
          builder: (_) =>
              const AuthenticationScreenT(pageType: MyRes.kResetPasswordPage),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => const EntryPointScreen(), settings: settings);
    }
  }
}
