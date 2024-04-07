


import 'package:flutter/material.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';

class HomeProvider extends ChangeNotifier {

   int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // sign out method
 Future<void> signOut() async {
    try {
      await sl<TokenManager>().clearToken();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to sign out');
    }}
  }
