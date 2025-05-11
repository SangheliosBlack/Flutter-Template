import 'package:hive/hive.dart';

part 'role_entity.g.dart';

@HiveType(typeId: 1)
class RoleEntity {

  @HiveField(0)
  final String name;

  RoleEntity({
    required this.name
  });

}
