import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/colors.dart';

Row buildAppBar({required int bank}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: MyColors.kPrimaryColor),
        child: MyCustomText(
          text: bank.toString(),
          style: TextStyle(
            color: MyColors.kWhite,
          ),
        ),
      ),

      // MyCustomText(
      //     text: bank.toString(),
      //     style: GoogleFonts.b612(
      //       textStyle: TextStyle(
      //           color: Colors.grey[700]!,
      //           fontSize: 15,
      //           fontWeight: FontWeight.w600),
      //     )),
    ],
  );
}
