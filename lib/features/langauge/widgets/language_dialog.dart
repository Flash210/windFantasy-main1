// Define the showLanguageDialog function
import 'package:flutter/material.dart';

void showLanguageDialog(
    BuildContext context, Function(String) onSelectLanguage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              onTap: () {
                onSelectLanguage('English');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('French'),
              onTap: () {
                onSelectLanguage('French');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
