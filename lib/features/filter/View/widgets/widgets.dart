import 'package:flutter/material.dart';




InkWell resetOrFilterButton({required String imagePath ,required Function()? onTap}) {
  return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Image.asset(
        // alignment: Alignment.centerRight,
        imagePath,
        width: 44,
        height: 44,
      ));
}



// ! check box

CheckboxListTile checkboxListTitleWidget({required String title,required bool isPlayerSelected,
required Function(bool?)? onChanged}) {
  return   CheckboxListTile(
                  title:  Text(title),
                  value: isPlayerSelected,
                  onChanged: onChanged,
                );
}
