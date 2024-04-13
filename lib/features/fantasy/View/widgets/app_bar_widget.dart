import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Row buildAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const DottedDashedLine(
        height: 3,
        width: 100,
        axis: Axis.horizontal,
        //dashColor: Colors.black,
      ),
      Consumer<PlayerProvider>(
        builder: (context, value, _) => MyCustomText(
            text: value.amount.toString(),
            style: GoogleFonts.b612(
              textStyle: TextStyle(
                  color: Colors.grey[700]!,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )),
      ),
      const DottedDashedLine(
        height: 3,
        width: 100,
        axis: Axis.horizontal,
      ),
    ],
  );
}
