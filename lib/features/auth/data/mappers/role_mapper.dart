import 'package:flutter_template/features/auth/data/data_transfer_objects/user_dto.dart';
import 'package:flutter_template/features/auth/domain/entities/role_entity.dart';

class RoleMapper {

  static RoleEntity toEntity({required UserDTO dto} ){

    return RoleEntity(
      name: dto.role
    );

  }

}