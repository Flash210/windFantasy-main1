import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/features/auth/View/reset_screen.dart';
import 'package:front/features/auth/View/sign_in_screen.dart';
import 'package:front/features/auth/View/sign_up_screen.dart';


import 'forget_password_screen.dart';

class AuthenticationScreenT extends StatelessWidget {
  final String pageType;

  const AuthenticationScreenT({
    super.key,
    required this.pageType,
  });

  @override
  Widget build(BuildContext context) {
    Widget body = Container(); // Initialize with your default widget

    switch (pageType) {
      case MyRes.kSignIn:
        body =  SignInScreenT();
        break;
      case MyRes.kSignUpPage:
        body = const SignUpScreenT();
        break;
      case MyRes.kForgetPasswordPage:
        body = const ForgetPasswordScreenT();
        break;
      case MyRes.kResetPasswordPage:
        body =  ResetPasswordScreen();
        break;
    }

    return Scaffold(


      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          MyRes.kAuthBackground,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(child: body),
      ]),
      //bottomNavigationBar: Text('Footer'),
    );
  }
}
