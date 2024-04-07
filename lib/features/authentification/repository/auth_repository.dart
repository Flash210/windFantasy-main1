// auth_repository.dart

abstract class AuthRepository {
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String teamName,
    required String password,
  });
  
  Future<String?> signIn({
    required String email,
    required String password,
  });

}
