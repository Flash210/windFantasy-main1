import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_constants.dart';
import '../../langauge/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: Image.asset(MyRes.kEnglishFlag, width: 30, height: 30),
          title: const Text('English'),
          onTap: () {
            Provider.of<LanguageProvider>(context, listen: false)
                .changeLanguage(AppLanguage.English);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset(MyRes.kFrenshFlag, width: 30, height: 30),
          title: const Text('French'),
          onTap: () {
            Provider.of<LanguageProvider>(context, listen: false)
                .changeLanguage(AppLanguage.French);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
