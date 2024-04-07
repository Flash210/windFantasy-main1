import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';

Padding buildProgressIndicator(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 150),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.005,
      width: MediaQuery.of(context).size.width * 0.5,
      child:  const LinearProgressIndicator(

        backgroundColor: MyColors.kGrey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    ),
  );
}
