class LoginCredentials {
  final String email;
  final String password;

  const LoginCredentials({
    required this.email,
    required this.password,
  });
}

class RegisterCredentials {
  final String email;
  final String password;
  final String fullName;

  const RegisterCredentials({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
