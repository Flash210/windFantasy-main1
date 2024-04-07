 import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';

ListTile buildListTile(IconData icon, String title, {Function()? onTap}){
    return ListTile(
      
      leading: Icon(icon),
      title: MyCustomText(text:title),
      onTap: onTap,
    );
  }