import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/View/auth_screen.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';

import 'package:uni_links/uni_links.dart';

class DeepLinkHandler {
  Future<void> initDeepLinks(BuildContext context, String page) async {
    // Initialize UniLinks for the initial link
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(context, initialLink ,page);
      }
    } on PlatformException {
      // Handle error
    }

    // Listen for new deep links
    getLinksStream().listen((String? link) {
      if (link != null) {
        _handleDeepLink(context, link,page );
      }
    }, onError: (error) {
      // Handle error
    });
  }

  void _handleDeepLink(BuildContext context, String link,String page) {
    // Extract token and determine the action from the deep link
    final uri = Uri.parse(link);
    final token = uri.queryParameters['token'];
  //  final action = uri.pathSegments.last;
  //          print("Action: $action");


    if (token != null) {
      switch (page) {
        case "signUp":
          sl<AuthProvider>().verifyEmail(token);
          sl<TokenManager>().saveToken(token);
          // Handle sign up verification
            Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AuthenticationScreenT(pageType: MyRes.kSignIn)),
        );
          break;
        case MyRes.kForgetPasswordPage:
          sl<TokenManager>().saveToken(token);

          break;
        default:
      }

      // Navigate to the appropriate screen based on the action
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => _getScreenForAction(action, token)),
      // );
    }
  }

  // Widget _getScreenForAction(String action, String token) {
  //   switch (action) {
  //     case MyRes.kSignUpPage:
  //       return AuthenticationScreenT(pageType: MyRes.kSignIn);
  //     case MyRes.kForgetPasswordPage:
  //       return AuthenticationScreenT(pageType: MyRes.kForgetPasswordPage);
  //     default:
  //       return CircularProgressIndicator();
  //   }
  // }
}
