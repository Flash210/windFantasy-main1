import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/auth/View/auth_screen.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/auth/utils/validate_fields.dart';
import 'package:front/features/auth/utils/validator.dart';

import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50.0),
          Text(
            S.of(context).NewPassword,
            style: const TextStyle(
              fontSize: 20.0,
              color: MyColors.kPrimaryColor,
            ),
          ),
          Text(S.of(context).EnterYourNewPassword),
          const SizedBox(height: 50.0),
          Consumer<AuthProvider>(builder: (context, provider, _) {
            return CustomInputField(
                fieldKey: passwordKey,
                obscureText: provider.obscureText,
                text: S.of(context).NewPassword,
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validatePassword(value, context),
                suffixIcon: IconButton(
                  icon: Icon(provider.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    provider.togglePasswordVisibility();
                  },
                ));
          }),

          Consumer<AuthProvider>(builder: (context, provider, _) {
            return CustomInputField(
                obscureText: provider.obscureText,
                fieldKey: confirmPasswordKey,
                text: S.of(context).ConfirmNewPassword,
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => validatePassword(value, context),
                suffixIcon: IconButton(
                  icon: Icon(provider.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    provider.togglePasswordVisibility();
                  },
                ));
          }),

          // CustomInputField(
          //   //obscureText: provider.obscureText,
          //   fieldKey: confirmPasswordKey,
          //   text: S.of(context).ConfirmNewPassword,
          //   controller: confirmPasswordController,
          //   keyboardType: TextInputType.visiblePassword,
          //   validator: (value) => validatePassword(value, context),
          // ),
          const SizedBox(height: 16.0),
          CustomOrangeButton(
            textColor: Colors.white,
            backgroundColor: MyColors.kPrimaryColor,
            text: S.of(context).Confirm,
            onTap: () async {
              if (passwordKey.currentState!.validate()) {
                if (confirmPasswordKey.currentState!.validate()) {
                  if (verifyPassword(
                      pass1: passwordController.text.trim(),
                      pass2: confirmPasswordController.text.trim(),
                      context: context)) {
                    await sl<AuthProvider>()
                        .resetPassword(
                            newPassword: passwordController.text.trim())
                        .then((value) => QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              confirmBtnColor: MyColors.kSecondaryColor,
                              title: 'Success',
                              text: 'Password Reset successfully',
                              onConfirmBtnTap: () => Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthenticationScreenT(
                                        pageType: MyRes.kSignIn,
                                      ),
                                    ),
                                    (route) => false,
                                  );
                                },
                              ),
                            ))
                        .onError((error, stackTrace) => QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              confirmBtnColor: MyColors.kSecondaryColor,
                              title: 'Oops...',
                              text: 'Sorry, something went wrong$error',
                              onConfirmBtnTap: () => Navigator.pop(context),
                            ));
                  }
                }
              }
            },
          ),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.40),
          buildPoweredBy(),
        ],
      ),
    );
  }
}
