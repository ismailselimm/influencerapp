class User {
  final String id;
  final String email;
  final String fullName;
  final DateTime? createdAt;
  final String? profileImageUrl;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.createdAt,
    this.profileImageUrl,
  });
}
