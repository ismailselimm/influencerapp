import '../entities/user.dart';
import '../entities/auth_credentials.dart';

abstract class AuthRepository {
  Future<User?> login(LoginCredentials credentials);
  Future<User?> register(RegisterCredentials credentials);
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<void> forgotPassword(String email);
}
