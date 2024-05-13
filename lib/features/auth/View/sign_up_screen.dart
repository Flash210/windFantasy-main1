import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/View/auth_screen.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';
import 'package:front/features/auth/keys_class.dart';
import 'package:front/features/auth/utils/validate_fields.dart';
import 'package:front/features/auth/View/widgets/welcome_text.dart';
import 'package:front/features/auth/utils/validator.dart';

import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:uni_links/uni_links.dart';

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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _teamController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: ScreenUtils.getHeight(context) * 0.080),

          buildWelcomeText(context),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

          Text(S.of(context).WelcomeSubSection),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),

          //? Name field
          CustomInputField(
            fieldKey: KeysValidation.nameKey,
            text: S.of(context).NameAndSurname,
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: (value) => validateName(value, context),
          ),

          //? Email field
          CustomInputField(
            fieldKey: KeysValidation.emailKey,
            text: S.of(context).Email,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value, context),
          ),

          //? Team field
          CustomInputField(
            fieldKey: KeysValidation.teamKey,
            text: S.of(context).TeamName,
            controller: _teamController,
            keyboardType: TextInputType.text,
            validator: (value) => validateTeamName(value, context),
          ),
          //? Phone field

          CustomInputField(
              fieldKey: KeysValidation.phoneKey,
              text: S.of(context).Phone,
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) => validatePhoneNumber(value, context)),
          //? Password field
          //? Password field
          Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return CustomInputField(
                fieldKey: KeysValidation.passwordKey,
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
            textColor: Colors.white,
            onTap: () {
              _submitForm();
            },
          ),

          SizedBox(
            height: ScreenUtils.getHeight(context) * 0.03,
          ),

          buildPoweredBy(),
        ],
      ),
    );
  }

  void _submitForm() {
    if (KeysValidation.nameKey.currentState!.validate()) {
      if (KeysValidation.emailKey.currentState!.validate()) {
        if (KeysValidation.teamKey.currentState!.validate()) {
          if (KeysValidation.phoneKey.currentState!.validate()) {
            if (KeysValidation.passwordKey.currentState!.validate()) {
              final signUpProvider =
                  Provider.of<AuthProvider>(context, listen: false);
              signUpProvider
                  .signUp(
                    name: _nameController.text.trim(),
                    email: _emailController.text.trim(),
                    phone: _phoneController.text.trim(),
                    teamName: _teamController.text.trim(),
                    password: _passwordController.text.trim(),
                  )
                  .then((value) => QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Mail Send Successfully!',
                        confirmBtnColor: MyColors.kSecondaryColor,
                        confirmBtnText: 'Check Your Mail',
                        onConfirmBtnTap: () {
                          print("Mail Send Successfully");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const AuthenticationScreenT(
                          //             pageType: MyRes.kSignIn,
                          //           )),
                          // );
                          lancherUrlToMail();
                        },
                      ))
                  .onError((error, stackTrace) => QuickAlert.show(
                        context: context,
                        confirmBtnColor: MyColors.kRed2,
                        type: QuickAlertType.error,
                        title: 'Oops...',
                        confirmBtnText: 'Try again',
                        text: 'Sorry, something went wrong',
                      ));
            }
          }
        }
      }
    }
  }
}
