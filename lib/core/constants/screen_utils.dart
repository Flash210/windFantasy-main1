import 'package:flutter/material.dart';

class ScreenUtils {


  static const double kSizedBoxHeight=30;
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }


  
}