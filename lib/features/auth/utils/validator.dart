
  import 'package:flutter/material.dart';
import 'package:front/core/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

verifyPassword(
      {required String pass1,
      required String pass2,
      required BuildContext context}) {
    if (pass1.contains(pass2)) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The password and confirmed password do not match'),
          backgroundColor: MyColors.kRed,
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
  }


  
  final Uri _url = Uri.parse('https://mailtrap.io');

Future<void> lancherUrlToMail() async {
  try {
    
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    await launchUrl(_url);
  } catch (e) {
  }
}