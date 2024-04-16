import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/View/widgets/remmber_me_widget.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/authentification/utils/validate_fields.dart';
import 'package:front/features/authentification/utils/welcome_text.dart';
import 'package:front/features/home%20screen/View/on_boarding_home.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common_widget/custom_input_field.dart';

class SignInScreenT extends StatefulWidget {
  const SignInScreenT({super.key});

  static const String routeName = '/login';

  @override
  SignInScreenTState createState() => SignInScreenTState();
}

class SignInScreenTState extends State<SignInScreenT> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userCredentialsProvider = sl<AuthProvider>();

  @override
  Widget build(BuildContext context) {
    //bool rememberMe = false;
    final userCredentials = userCredentialsProvider.userCredentials;

    if (userCredentials != null) {
      _emailController.text = userCredentials.email;
      _passwordController.text = userCredentials.password;
    }

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: ScreenUtils.getHeight(context) * 0.1),

              buildWelcomeText(context),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

              Text(S.of(context).WelcomeSubSection),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.05),

              CustomInputField(
                text: S.of(context).Email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value, context),
              ),

              //? Password field
              Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return CustomInputField(
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
                onTap: () async {
                  _submit();
                },
              ),

              SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

              buildRemmemberAndForget(userCredentials, userCredentialsProvider,
                  context, _emailController, _passwordController),
              SizedBox(
                height: ScreenUtils.getHeight(context) * 0.22,
              ),
              buildPoweredBy(),
            ],
          )),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Provider.of<AuthProvider>(context, listen: false).signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // .then((value) => awesomeDialog(
      //     context: context,
      //     text: MyRes.kSignInSucces,
      //     type: DialogType.success,
      //     showRed: false))
      // .catchError((error) => awesomeDialog(
      //     context: context,
      //     text: MyRes.kSignInError,
      //     type: DialogType.error,
      //     showRed: true));

      Future.delayed(const Duration(seconds: 2), () {
        if (Provider.of<AuthProvider>(context, listen: false).isAuthenticated) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const Homey();
          }), (route) => false);
        }
      });
    }
  }
}
