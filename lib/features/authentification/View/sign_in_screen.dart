import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/authentification/View/auth_screen.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/authentification/utils/validate_fields.dart';
import 'package:front/features/authentification/utils/welcome_text.dart';
import 'package:front/features/home%20screen/View/on_boarding_home.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../../../core/common_widget/custom_input_field.dart';

// class SignInScreenT extends StatefulWidget {
//   const SignInScreenT({super.key});

//   static const String routeName = '/login';

//   @override
//   SignInScreenTState createState() => SignInScreenTState();
// }

// class SignInScreenTState extends State<SignInScreenT> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   final TextEditingController _emailController = TextEditingController();

//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final userCredentialsProvider = sl<AuthProvider>();
//   final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     //bool rememberMe = false;
//     final userCredentials = userCredentialsProvider.userCredentials;

//     if (userCredentials != null) {
//       _emailController.text = userCredentials.email;
//       _passwordController.text = userCredentials.password;
//     }

//     return Padding(
//         padding: const EdgeInsets.all(30.0),
//         // child: Form(
//         // key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: ScreenUtils.getHeight(context) * 0.1),

//             buildWelcomeText(context),
//             SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

//             Text(S.of(context).WelcomeSubSection),
//             SizedBox(height: ScreenUtils.getHeight(context) * 0.05),

//             CustomInputField(
//               fieldKey: _emailKey,
//               text: S.of(context).Email,
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) => validateEmail(value, context),
//             ),

//             //? Password field
//             Consumer<AuthProvider>(
//               builder: (context, provider, _) {
//                 return CustomInputField(
//                   fieldKey: _nameKey,
//                   text: S.of(context).Password,
//                   suffixIcon: IconButton(
//                     icon: Icon(provider.obscureText
//                         ? Icons.visibility
//                         : Icons.visibility_off),
//                     onPressed: () {
//                       provider.togglePasswordVisibility();
//                     },
//                   ),
//                   controller: _passwordController,
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: provider.obscureText,
//                   validator: (value) => validatePassword(value, context),
//                 );
//               },
//             ),

//             SizedBox(height: ScreenUtils.getHeight(context) * 0.03),
//             CustomOrangeButton(
//               textColor: MyColors.kWhite,
//               backgroundColor: MyColors.kPrimaryColor,
//               text: S.of(context).SignIn,
//               onTap: () {
//                 _submit();
//               },
//             ),

//             SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

//             buildRemmemberAndForget(userCredentials, userCredentialsProvider,
//                 context, _emailController, _passwordController),
//             SizedBox(
//               height: ScreenUtils.getHeight(context) * 0.22,
//             ),
//             buildPoweredBy(),
//           ],
//         )
//         //),
//         );
//   }

//   void _submit() {
//     if (_nameKey.currentState!.validate()) {
//       if (_emailKey.currentState!.validate()) {
//         Provider.of<AuthProvider>(context, listen: false)
//             .signIn(
//               email: _emailController.text,
//               password: _passwordController.text,
//             )
//             .then((value) => QuickAlert.show(
//                   context: context,
//                   type: QuickAlertType.success,
//                   text: 'Sign In Completed Successfully!',
//                 ))
//             .onError((error, stackTrace) => QuickAlert.show(
//                   context: context,
//                   type: QuickAlertType.error,
//                   confirmBtnColor: MyColors.kGreen,
//                   title: 'Oops...',
//                   text: 'Sorry, something went wrong',
//                   onConfirmBtnTap: () => Navigator.pop(context),
//                 ));
//       }
//     }
//   }
// }

class SignInScreenT extends StatelessWidget {
  SignInScreenT({Key? key}) : super(key: key);

  static const String routeName = '/login';

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _passwordSignIN = GlobalKey<FormState>();

  final GlobalKey<FormState> _emailSignIN = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false; // Add this line to track the state of the checkbox
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: ScreenUtils.getHeight(context) * 0.1),

          buildWelcomeText(context),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

          Text(S.of(context).WelcomeSubSection),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.05),

          CustomInputField(
            fieldKey: _emailSignIN,
            text: S.of(context).Email,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value, context),
          ),

          //? Password field
          Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return CustomInputField(
                fieldKey: _passwordSignIN,
                text: S.of(context).Password,
                suffixIcon: IconButton(
                  icon: Icon(provider.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    provider.togglePasswordVisibility();
                  },
                ),
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: provider.obscureText,
                validator: (value) => validatePassword(value, context),
              );
            },
          ),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),
          CustomOrangeButton(
            textColor: MyColors.kWhite,
            backgroundColor: MyColors.kPrimaryColor,
            text: S.of(context).SignIn,
            onTap: () {
              _submit(context: context);
            },
          ),

          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (bool? value) {
                  rememberMe = value!;
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
          ),
          SizedBox(
            height: ScreenUtils.getHeight(context) * 0.15,
          ),
          buildPoweredBy(),
        ],
      ),
    );
  }

  void _submit({required BuildContext context}) {
    if (_emailSignIN.currentState!.validate()) {
      if (_passwordSignIN.currentState!.validate()) {
        Provider.of<AuthProvider>(context, listen: false)
            .signIn(
              email: _emailController.text,
              password: _passwordController.text,
            )
            .then((value) => QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Sign In Completed Successfully!',
                  onConfirmBtnTap: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      if (Provider.of<AuthProvider>(context, listen: false)
                          .isAuthenticated) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return const Homey();
                        }), (route) => false);
                      }
                    });
                  },
                ))
            .onError((error, stackTrace) => QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  confirmBtnColor: MyColors.kGreen,
                  title: 'Oops...',
                  text: 'Sorry, something went wrong',
                  onConfirmBtnTap: () => Navigator.pop(context),
                ));
      }
    }
  }
}
