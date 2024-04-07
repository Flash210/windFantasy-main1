import 'package:flutter/material.dart';

import 'package:front/core/constants/colors.dart';

class CustomInputField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  const CustomInputField(
      {super.key,
      required this.text,
      required this.controller,
      required this.keyboardType,
      this.obscureText,
      this.suffixIcon,
      required this.validator, this.hintText});
      

  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Container(
            margin: const EdgeInsets.only(top: 3, right: 11.0, bottom: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: TextFormField(
              
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  
                  hintText: hintText,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.kPrimaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    suffixIcon: suffixIcon),
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText ?? false,
                
                validator: (value) {
                  // Validate the input value using the provided validator function
                  if (validator != null) {
                    final validationResult = validator!(value);
                    if (validationResult != null) {
                      //  CustomErrorSnackbar(errorMessage: validationResult,color: MyColors.kRed,);
                      // Show scaffold message error if validation fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(validationResult),
                          backgroundColor: MyColors.kRed,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                }),
          ),
        ]);
  }
}
