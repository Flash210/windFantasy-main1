import 'dart:convert';

import 'package:front/features/authentification/api/api.dart';
import 'package:front/features/authentification/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository { 
  final AuthApi _authApi;


  AuthRepositoryImpl({required AuthApi authApi}) : _authApi = authApi;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String teamName,
    required String password,
  }) async {
    final response = await _authApi.signUp(
      name: name,
      email: email,
      phone: phone,
      teamName: teamName,
      password: password,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sign up');
    }
  }
  
  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authApi.signIn(
      email: email,
      password: password,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String? token = responseData['data']['token'] as String?;
      return token;
    } else {
      throw Exception('Failed to sign in');
    }
  }
 




 
}


