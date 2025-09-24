import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Demo users for testing
  static final List<User> _demoUsers = [
    User(
      id: '1',
      email: 'admin@kuwa.com',
      fullName: 'Admin User',
    ),
    User(
      id: '2', 
      email: 'test@example.com',
      fullName: 'Test User',
    ),
    User(
      id: '3',
      email: 'emre@kuwa.com', 
      fullName: 'Emre Kuwa',
    ),
  ];

  static const String _validPassword = '123456';

  @override
  Future<User?> login(LoginCredentials credentials) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Find user by email
    final user = _demoUsers.where((u) => u.email == credentials.email).firstOrNull;
    
    if (user != null && credentials.password == _validPassword) {
      return user;
    }
    
    return null;
  }

  @override
  Future<User?> register(RegisterCredentials credentials) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Check if email already exists
    final existingUser = _demoUsers.where((u) => u.email == credentials.email).firstOrNull;
    if (existingUser != null) {
      return null; // Email already exists
    }
    
    // Create new user
    final newUser = User(
      id: '${_demoUsers.length + 1}',
      email: credentials.email,
      fullName: credentials.fullName,
    );
    
    _demoUsers.add(newUser);
    return newUser;
  }

  @override
  Future<void> forgotPassword(String email) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    // In a real app, this would send reset email
  }

  @override
  Future<bool> isEmailRegistered(String email) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return _demoUsers.any((user) => user.email == email);
  }

  @override
  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    // In a real app, this would clear tokens, etc.
  }

  @override
  Future<User?> getCurrentUser() async {
    // For demo purposes, return null (no persisted session)
    return null;
  }
}
