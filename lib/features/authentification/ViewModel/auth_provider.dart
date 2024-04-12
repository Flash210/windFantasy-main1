import 'dart:convert';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/authentification/Model/user_credentials.dart';
import 'package:front/features/authentification/repository/authentification_repository.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:front/core/services/config.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/repository/auth_repository.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final AuthentificationRepository authentificationRepository;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  AuthProvider(
      {required this.authentificationRepository,
      required AuthRepository authRepository})
      : _authRepository = authRepository;

  //  You? userHaya;

  // Future<You> getUserData() async {
  //   userHaya = await authentificationRepository.getUserDataInfo();
  //   return userHaya!;
  // }

// ! Sign up method
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String teamName,
    required String password,
  }) async {
    try {
      await _authRepository.signUp(
        name: name,
        email: email,
        phone: phone,
        teamName: teamName,
        password: password,
      );
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to sign up');
    }
  }

// ! Sign in method

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final token =
          await _authRepository.signIn(email: email, password: password);
      _isAuthenticated = true;

      if (token != null) {
        await TokenManager().saveToken(token);
      } else {
        throw Exception('Token not found');
      }
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  void setAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }


UserData? userDataa;
// ! Get user info method
  Future<UserModel?> getUserInfo() async {
    Logger logger = Logger();

    try {
      final String? token = await sl<TokenManager>().getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse(AppConfig.kUserBaseUrl +
            AppConfig.kGetUserInfo), // Using the base URL from constants
        headers: {
          'Authorization':
              'Bearer $token', // Include the JWT token in the headers
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);
        final UserModel user = UserModel.fromJson(jsonData);

        ///sl<TokenManager>().saveUserId(user.data.id.toString());
        var ch = await sl<TokenManager>().getUserId();
        print("User Id is +$ch");
        //logger.i("id is ${user.data.id}");
        userDataa=user.data ;
        notifyListeners();

        return user;
      } else {
        logger.e('Failed to fetch user info${response.body}');

        throw Exception('Failed to fetch user info');
      }
    } catch (e) {
      logger.e('Failed to fetch user info$e');

      return null;
    }
  }

  // ! verify user

  Future<void> verifyEmail(String token) async {
    try {
      // Make the GET request
      final response = await http.get(
        Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kValidateUser + token),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the response body
        final responseBody = json.decode(response.body);

        if (responseBody['success']) {
          notifyListeners();
        } else {}
      } else {
        throw Exception('Failed to verify email.');
      }
    } catch (e) {
      throw Exception('Error Net ');
    }
  }

  // !! forget password

  Future<bool> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kForgetPasswordEndPoint),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ! Reset password method
  Future<bool> resetPassword(String newPassword) async {
    final response = await http.post(
      Uri.parse(AppConfig.kUserBaseUrl + AppConfig.kResetPasswordEndPoint),
      body: {'newPassword': newPassword},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ! password visibility
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

// ! user credentials
  UserCredentials? _userCredentials;

  UserCredentials? get userCredentials => _userCredentials;

  void setUserCredentials({required String email, required String password}) {
    _userCredentials = UserCredentials(email: email, password: password);
    notifyListeners();
  }
}
