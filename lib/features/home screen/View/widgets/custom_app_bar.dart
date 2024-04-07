import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';

AppBar buildCustomAppBar(String appBarTitle) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.only(top: 30, right: 50),
      child: Center(
          child: Text(
        appBarTitle,
        style: const TextStyle(color: MyColors.kSecondaryColor),
      )),
    ),
    leading: const Padding(
      padding: EdgeInsets.only(top: 30, left: 20),
      child: Icon(
        Icons.arrow_back,
        color: MyColors.kSecondaryColor,
      ),
    ),
  );
}
