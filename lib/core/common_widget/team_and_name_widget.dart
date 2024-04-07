import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fixtures/utils/commun_function.dart';
import 'package:google_fonts/google_fonts.dart';

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
