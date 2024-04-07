import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_orange_btn.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/authentification/View/auth_screen.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/authentification/utils/validate_fields.dart';
import 'package:front/features/authentification/utils/welcome_text.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import '../../../../../../core/common_widget/powered_by.dart';

class SignUpScreenT extends StatefulWidget {
  const SignUpScreenT({super.key});

  static const String routeName = '/signUp';

  @override
  SignUpScreenTState createState() => SignUpScreenTState();
}

class SignUpScreenTState extends State<SignUpScreenT> {
  @override
  void initState() {
    initDeepLinks();
    // sl<DeepLinkHandler>().initDeepLinks(context,"signUp");

    super.initState();
  }

  Future<void> initDeepLinks() async {
    // Initialize UniLinks
    try {
      await getInitialLink();
    } on PlatformException {
      // Handle error
    }

    // Listen for deep links
    getLinksStream().listen((String? link) {
      if (link != null) {
        handleDeepLink(link);
      }
    }, onError: (error) {
      // Handle error
    });
  }

  void handleDeepLink(String link) {
    // Extract token from the deep link
    final token = link.split('/').last;

    sl<TokenManager>().saveToken(token);
    sl<AuthProvider>().verifyEmail(token);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AuthenticationScreenT(
                pageType: MyRes.kSignIn,
              )),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //  SizedBox(height: ScreenUtils.getHeight(context) * 0.05),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.080),

              buildWelcomeText(context),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

              Text(S.of(context).WelcomeSubSection),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.03),
              // Your CustomInputField widgets

              CustomInputField(
                text: S.of(context).NameAndSurname,
                controller: nameController,
                keyboardType: TextInputType.text,
                validator: (value) => validateName(value, context),
              ),

              //? Email field
              CustomInputField(
                text: S.of(context).Email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value, context),
              ),
              //? Team field
              CustomInputField(
                text: S.of(context).TeamName,
                controller: _teamController,
                keyboardType: TextInputType.text,
                validator: (value) => validateTeamName(value, context),
              ),
              //? Phone field

              CustomInputField(
                  text: S.of(context).Phone,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validatePhoneNumber(value, context)),
              //? Password field
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
                backgroundColor: MyColors.kPrimaryColor,
                text: S.of(context).SignUp,
                textColor: Colors.black,
                onTap: () {
                  _submitForm();
                },
              ),

              SizedBox(
                height: ScreenUtils.getHeight(context) * 0.03,
              ),

              buildPoweredBy(),
            ],
          )),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final signUpProvider = Provider.of<AuthProvider>(context, listen: false);
      signUpProvider
          .signUp(
            name: nameController.text.trim(),
            email: _emailController.text.trim(),
            phone: _phoneController.text.trim(),
            teamName: _teamController.text.trim(),
            password: _passwordController.text.trim(),
          );
          // .then((value) =>
          //  awesomeDialog(context:context, text: MyRes.kSignUpSucces,type: 
          //   DialogType.success,showRed: false))
          // .catchError((error) {
          //   awesomeDialog(
          //       context: context,
          //       text: MyRes.kSignUpError,
              
          //       type: DialogType.error,
          //       showRed: true
          //       );
          // });
    }
  }
}


