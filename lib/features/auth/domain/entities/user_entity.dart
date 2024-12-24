class UserEntity {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final String role;
  final DateTime lastUpdate;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.role,
    required this.lastUpdate,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? lastName,
    String? role,
    DateTime? lastUpdate,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
