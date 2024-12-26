// ignore_for_file: constant_identifier_names

enum Role {

  ADMIN('Administrator'),
  USER('User');

  final String description;

  const Role(this.description);
  
}

class UserEntity {
  final String id;
  final String email;
  final String name;
  final Role role;
  final DateTime lastUpdate;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.lastUpdate,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? lastName,
    Role? role,
    DateTime? lastUpdate,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
