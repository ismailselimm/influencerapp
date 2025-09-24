import '../../domain/entities/user.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  const AuthUseCase(this._authRepository);

  Future<User?> login(LoginCredentials credentials) async {
    return await _authRepository.login(credentials);
  }

  Future<User?> register(RegisterCredentials credentials) async {
    return await _authRepository.register(credentials);
  }

  Future<void> logout() async {
    return await _authRepository.logout();
  }

  Future<User?> getCurrentUser() async {
    return await _authRepository.getCurrentUser();
  }

  Future<void> forgotPassword(String email) async {
    return await _authRepository.forgotPassword(email);
  }
}
