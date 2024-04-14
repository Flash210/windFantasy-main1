
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/btn_and_text_widget.dart';
import 'package:front/core/common_widget/custom_input_field.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/features/authentification/utils/validate_fields.dart';
import 'package:front/generated/l10n.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String routeName = '/login';

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<ResetPasswordScreen> {

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
// Add this line to track the state of the checkbox

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
          key: _formKey,
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
              // Your CustomInputField widgets

              //? Name and Surname field

              //? Email field
              CustomInputField(
                text: S.of(context).NewPassword,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value, context),
              ),
              CustomInputField(
                text: S.of(context).ConfirmNewPassword,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value, context),
              ),

              const SizedBox(height: 16.0),
             

              CustomOrangeButton(
                backgroundColor: MyColors.kPrimaryColor,
                text: S.of(context).Confirm,
                onTap: () {
             
                },
              ),
              SizedBox(height: ScreenUtils.getHeight(context) * 0.40),
              buildPoweredBy(),
            ],
          )),
    );
  }
}
