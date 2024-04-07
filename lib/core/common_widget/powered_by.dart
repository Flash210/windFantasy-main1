import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';

Column buildPoweredBy() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          color: MyColors.kPrimaryColor,
          thickness: 1.0,
        ),
        Text(
          "Powred By WindConsulting",
          style: TextStyle(color: MyColors.kPrimaryColor),
        )
      ],
    );
  }