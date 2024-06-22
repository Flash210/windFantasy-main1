import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/features/fixtures/Model/fixture.dart';

import 'package:http/http.dart' as http;


class FixtureProvider extends ChangeNotifier {
  List<Fixture> _fixtures = [];
  List<Fixture> get fixtures => _fixtures;

  Future<List<Fixture>> getFixtures() async {
    try {
      final response = await http.get(
          Uri.parse(AppConfig.kFixtureBaseUrl + AppConfig.kGetAllFixtures));

      final jsonData = json.decode(response.body);

      if (jsonData['success']) {
        final fixturesData = jsonData['data'] as List<dynamic>;
        _fixtures = fixturesData
            .map((fixtureData) => Fixture.fromJson(fixtureData))
            .toList();
        notifyListeners();
        return _fixtures;
      } else {
        return [];
      }
    } catch (e) {
      // Handle network or parsing errors
      return [];
    }
  }
}
