import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fixtures/utils/commun_function.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final Color? color;
final TextStyle? style;

  const MyCustomText({
    required this.text,
    this.textAlign,
    super.key,
    this.color,
    this.style
  });
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      style:style,
      textAlign: textAlign,
    );
  }
}




class MySizedBox extends StatelessWidget {


  final double? height;
  final double? width;
  const MySizedBox({super.key,  this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

    );
  }
}


class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height *0.2,),
             
               Center(
                  child: Image.asset(
                    MyRes.kWindLogo,
                    fit: BoxFit.contain,
                      width: width * 0.5,
                    height: height * 0.2,
                  ),
                ),
              
            ],
        )
        )
    );
            
  }
}



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


  Row buildTeamAndName({required Team team, required bool textRight}) {
  return Row(
    children: [
      if (textRight) ...[
        Image.network(
          team.logo!,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        MyCustomText(
          text: getTeamAbbreviation(team.name!),
          style: GoogleFonts.anton(),
        ),
      ],
      if (!textRight) ...[
        MyCustomText(
          text: getTeamAbbreviation(team.name!),
          style: GoogleFonts.anton(),
        ),
        const SizedBox(width: 10),
        Image.network(
          team.logo!,
          width: 30,
          height: 30,
        ),
      ],
    ],
  );
}
