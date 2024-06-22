import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/ranking/model/ranking_user.dart';
import 'package:front/features/ranking/model/top_user_gameweek.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

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


  Future<List<TopUser>> getTopUserInGameweek(int gameweek) async {
    Logger logger=Logger();
    final String? token = await sl<TokenManager>().getToken();

    try {
      final response = await http.get(
          Uri.parse("${AppConfig.kUserBaseUrl}TeamOfTopUserInGW/15",),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',

          }
      );
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
var data =decodedData['data'];
        notifyListeners();
        //logger.i(topUsers);

        return data.map((String key, dynamic json) {
          return MapEntry<dynamic, dynamic>(key, TopUser.fromJson(json));
        }).toList();


      } else {
        logger.e("Failed to load data${response.statusCode}");
        logger.e("Failed to load data${response.body}");
        logger.e("Failed to load data${response.request}");
        throw Exception('Failed to load data');
      }
    } catch (error) {
      logger.e("Failed to load data Internet $error" );
      print(error);
      throw Exception('Failed to load data');
    }
  }
}
