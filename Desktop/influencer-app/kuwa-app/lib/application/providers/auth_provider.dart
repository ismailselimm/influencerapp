import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import '../../domain/entities/auth_credentials.dart';
import '../use_cases/auth_use_case.dart';
import '../../infrastructure/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  return AuthUseCase(ref.watch(authRepositoryProvider));
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier(ref.read(authUseCaseProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthUseCase _authUseCase;

  AuthNotifier(this._authUseCase) : super(const AsyncValue.data(null)) {
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = await _authUseCase.getCurrentUser();
    state = AsyncValue.data(user);
  }

  Future<bool> login(LoginCredentials credentials) async {
    state = const AsyncValue.loading();
    
    try {
      final user = await _authUseCase.login(credentials);
      if (user != null) {
        state = AsyncValue.data(user);
        return true;
      } else {
        state = const AsyncValue.data(null);
        return false;
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> register(RegisterCredentials credentials) async {
    state = const AsyncValue.loading();
    
    try {
      final user = await _authUseCase.register(credentials);
      if (user != null) {
        state = AsyncValue.data(user);
        return true;
      } else {
        state = const AsyncValue.data(null);
        return false;
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    await _authUseCase.logout();
    state = const AsyncValue.data(null);
  }

  Future<void> forgotPassword(String email) async {
    await _authUseCase.forgotPassword(email);
  }
}
