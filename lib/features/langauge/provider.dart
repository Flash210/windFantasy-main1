import 'package:flutter/material.dart';

enum AppLanguage { English, French }

// Create a class for language state management
class LanguageProvider with ChangeNotifier {
  AppLanguage _appLanguage = AppLanguage.French;

  AppLanguage get appLanguage => _appLanguage;

  void changeLanguage(AppLanguage language) {
    _appLanguage = language;
    notifyListeners();
  }
}