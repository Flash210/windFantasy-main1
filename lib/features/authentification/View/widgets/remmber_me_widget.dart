import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/authentification/Model/user_credentials.dart';
import 'package:front/features/authentification/View/auth_screen.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/generated/l10n.dart';

Row buildRemmemberAndForget(
      UserCredentials? userCredentials, AuthProvider userCredentialsProvider, BuildContext context, TextEditingController emailController, TextEditingController passwordController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: userCredentials != null,
          onChanged: (value) {
            if (value != null) {
              userCredentialsProvider.setUserCredentials(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              userCredentialsProvider.setUserCredentials(
                email: '',
                password: '',
              );
            }
          },
        ),
        Text(
          S.of(context).RememberMe,
          style: const TextStyle(fontSize: 11),
        ),
        SizedBox(width: ScreenUtils.getWidth(context) * 0.03),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AuthenticationScreenT(
                        pageType: MyRes.kForgetPasswordPage);
                  },
                ),
              );
            },
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                S.of(context).ForgotPassword,
                style: const TextStyle(color: MyColors.kPrimaryColor),
              ),
            ),
          ),
        )
      ],
    );
  }