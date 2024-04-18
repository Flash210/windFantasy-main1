import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/View/auth_screen.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/authentification/utils/validate_fields.dart';
import 'package:front/generated/l10n.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   static const String routeName = '/login';

//   @override
//   SignInScreenState createState() => SignInScreenState();
// }

// class SignInScreenState extends State<ResetPasswordScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> _confirmKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {

//     return Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//       const SizedBox(height: 50.0),
//       Text(
//         S.of(context).NewPassword,
//         style: const TextStyle(
//           fontSize: 20.0,
//           color: MyColors.kPrimaryColor,
//         ),
//       ),
//       Text(S.of(context).EnterYourNewPassword),
//       const SizedBox(height: 50.0),
//       // Your CustomInputField widgets

//       //? Name and Surname field

//       //? Email field
//       CustomInputField(
//         fieldKey: _formKey,
//         text: S.of(context).NewPassword,
//         controller: _passwordController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) => validatePassword(value, context),
//       ),
//       CustomInputField(
//         fieldKey: _confirmKey,
//         text: S.of(context).ConfirmNewPassword,
//         controller: _confirmPasswordController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) => validatePassword(value, context),
//       ),

//       const SizedBox(height: 16.0),

//       CustomOrangeButton(
//         backgroundColor: MyColors.kPrimaryColor,
//         text: S.of(context).Confirm,
//         onTap: () async {
//           if (_formKey.currentState!.validate()) {
//             if (_confirmKey.currentState!.validate()) {
//               await sl<AuthProvider>()
//                   .resetPassword(
//                       newPassword: _passwordController.text.trim())
//                   .then((value) => QuickAlert.show(
//                       context: context,
//                       type: QuickAlertType.success,
//                       confirmBtnColor: MyColors.kGreen,
//                       title: 'Success',
//                       text: 'Password Reset successfully',
//                       onConfirmBtnTap: () =>
//                           Future.delayed(const Duration(seconds: 2), () {
//                             Navigator.pushAndRemoveUntil(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return const AuthenticationScreenT(
//                                   pageType: MyRes.kSignIn);
//                             }), (route) => false);
//                           })))
//                   .onError((error, stackTrace) => QuickAlert.show(
//                         context: context,
//                         type: QuickAlertType.error,
//                         confirmBtnColor: MyColors.kGreen,
//                         title: 'Oops...',
//                         text: 'Sorry, something went wrong',
//                         onConfirmBtnTap: () => Navigator.pop(context),
//                       ));
//             }
//           }
//         },
//       ),
//       SizedBox(height: ScreenUtils.getHeight(context) * 0.40),
//       buildPoweredBy(),
//               ],
//             ),
//     );
//   }
// }

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50.0),
          Text(
            S.of(context).NewPassword,
            style: TextStyle(
              fontSize: 20.0,
              color: MyColors.kPrimaryColor,
            ),
          ),
          Text(S.of(context).EnterYourNewPassword),
          SizedBox(height: 50.0),
          CustomInputField(
            fieldKey: formKey,
            text: S.of(context).NewPassword,
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validatePassword(value, context),
          ),
          CustomInputField(
            fieldKey: confirmKey,
            text: S.of(context).ConfirmNewPassword,
            controller: confirmPasswordController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validatePassword(value, context),
          ),
          SizedBox(height: 16.0),
          CustomOrangeButton(
            backgroundColor: MyColors.kPrimaryColor,
            text: S.of(context).Confirm,
            onTap: () async {
              // if (formKey.currentState!.validate()) {
              //   if (confirmKey.currentState!.validate()) {
              await sl<AuthProvider>()
                  .resetPassword(newPassword: passwordController.text.trim())
                  .then((value) => QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        confirmBtnColor: MyColors.kGreen,
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
                        confirmBtnColor: MyColors.kGreen,
                        title: 'Oops...',
                        text: 'Sorry, something went wrong'+error.toString(),
                        onConfirmBtnTap: () => Navigator.pop(context),
                      ));
              //   }
              // }
            },
          ),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.40),
          buildPoweredBy(),
        ],
      ),
    );
  }
}
