import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/ranking/model/ranking_user.dart';
import 'package:http/http.dart' as http;

class RankingProvider extends ChangeNotifier {
  UserRank? _userRank; // Make _userRank nullable

  UserRank? get userRank => _userRank;

  Future<void> fetchUserRank() async {
    final String? token = await sl<TokenManager>().getToken();

    if (token == null) {
      return;
    }

    try {
      final Uri uri =
          Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kGetAllRankings);
      final Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(uri, headers: headers);

      final jsonData = json.decode(response.body);

      final bool success = jsonData['success'] ?? false;

      if (success) {
        _userRank = UserRank.fromJson(jsonData['data']);
        notifyListeners();
      } else {
        throw Exception('Failed to load user rank');
      }
    } catch (error) {
      throw Exception('Failed to fetch user rank: $error');
    }
  }
}
