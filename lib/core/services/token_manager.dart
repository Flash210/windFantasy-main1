import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // Singleton instance
  static final TokenManager _instance = TokenManager._internal();
  factory TokenManager() => _instance;
  TokenManager._internal();

  // Key for storing token in SharedPreferences
  static const String _tokenKey = 'token';
  static const String _userId = 'id';

  // Function to save token locally
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Function to save user id
  Future<void> saveUserId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, id);
  }

  // Function to retrieve token from local storage
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }

  // Function to retrieve token from local storage
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Function to clear token from local storage
  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static const String _mapKey = 'my_map';

  // Function to save map
  Future<void> savePlayerPositionToMap(
      {required Map<String, String> map}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(map);
    await prefs.setString(_mapKey, jsonString);
  }

  // Function to retrieve map from local storage
  Future<Map<String, dynamic>> getMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString(_mapKey) ?? '{}';
   // print("json is " + jsonString);
    return json.decode(jsonString);
  }

  //! .............

  static const String _tShirt = '_tShirt';

  // Function to save map
  Future<void> saveTshirtTeamToMap({required Map<String, String> map}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(map);
    await prefs.setString(_tShirt, jsonString);
  }

  // Function to retrieve map from local storage
  Future<Map<String, dynamic>> getTshirtMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString(_tShirt) ?? '{}';
  //  print("Tshirt player  " + jsonString);
    return json.decode(jsonString);
  }

  Future<void> clearMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mapKey);
  }

  // Function to clear all data from local storage
  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
