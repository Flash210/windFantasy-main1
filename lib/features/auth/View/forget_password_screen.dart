import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/common_widget/show_player_widget.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/View/auth_screen.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/auth/utils/validate_fields.dart';
import 'package:front/features/auth/utils/validator.dart';
import 'package:front/generated/l10n.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/quickalert.dart';
import 'package:uni_links/uni_links.dart';

class ForgetPasswordScreenT extends StatefulWidget {
  const ForgetPasswordScreenT({super.key});

  static const String routeName = 'forgetpassword';

  @override
  ForgetPasswordScreenTState createState() => ForgetPasswordScreenTState();
}

class ForgetPasswordScreenTState extends State<ForgetPasswordScreenT> {
  @override
  void initState() {
    initDeepLinks();
    super.initState();
  }

  Logger logger = Logger();
  Future<void> initDeepLinks() async {
    // Initialize UniLinks
    try {
      await getInitialLink();
      logger.i('Initial link...');
    } on PlatformException {
      // Handle error
    }

    // Listen for deep links
    getLinksStream().listen((String? link) {
      if (link != null) {
        logger.i('Link is not null : $link');
        handleDeepLink(link);
      }
    }, onError: (error) {
      logger.e('link error: $error');
      // Handle error
    });
  }

  void handleDeepLink(String link) {
    final token = link.split('/').last;

    sl<TokenManager>().saveToken(token);
    //sl<AuthProvider>().verifyEmail(token);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AuthenticationScreenT(
                pageType: MyRes.kResetPasswordPage,
              )),
    );
  }

  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: ScreenUtils.getHeight(context) * 0.1),
          Text(
            S.of(context).ForgotPasswordBtn,
            style: const TextStyle(
              fontSize: 20.0,
              color: MyColors.kPrimaryColor,
            ),
          ),
          Text(S.of(context).EnterYourEmail),
          SizedBox(height: ScreenUtils.getHeight(context) * 0.05),

          //? Email field

          CustomInputField(
            fieldKey: _emailKey,
            text: S.of(context).Email,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value, context),
          ),
          Center(
              child: Text(
            S.of(context).ComeBackForConnect,
            style: const TextStyle(fontSize: 11),
          )),

          SizedBox(height: ScreenUtils.getHeight(context) * 0.03),
          CustomOrangeButton(
            textColor: MyColors.kWhite,
            backgroundColor: MyColors.kPrimaryColor,
            text: S.of(context).Send,
            onTap: () async {
              if (_emailKey.currentState!.validate()) {
                await sl<AuthProvider>()
                    .forgotPassword(_emailController.text.trim())
                    .then((value) => buildQuicAlert(
                        quickAlertType: QuickAlertType.success,
                        context: context,
                        confirmBtnText: "Check Email",
                        confirmBtnColor: MyColors.kSecondaryColor,
                        title: 'Success',
                        text: 'Email sent successfully',
                        onConfirmBtnTap: () => lancherUrlToMail()))
                    .onError((error, stackTrace) => buildQuicAlert(
                        quickAlertType: QuickAlertType.error,
                        context: context,
                        confirmBtnColor: MyColors.kSecondaryColor,
                        title: 'Oops...',
                        text: 'Sorry, something went wrong',
                        onConfirmBtnTap: () => Navigator.pop(context)));
              }
            },
          ),

          SizedBox(
            height: ScreenUtils.getHeight(context) * 0.50,
          ),
          buildPoweredBy(),
        ],
      ),
    );
  }
}
