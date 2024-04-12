import 'dart:convert';

import 'package:front/core/services/config.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<http.Response> signUp({
    required String name,
    required String email,
    required String phone,
    required String teamName,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kSignUpEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'phone': phone,
        'teamName': teamName,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> signIn({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kSignInEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }






}
