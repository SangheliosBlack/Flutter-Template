// ignore_for_file: constant_identifier_names

import 'package:flutter_template/features/auth/domain/entities/role_entity.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {

  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String email;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final RoleEntity role;

  @HiveField(4)
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
    RoleEntity? role,
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
