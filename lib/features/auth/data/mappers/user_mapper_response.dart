import 'package:flutter_template/features/auth/data/mappers/mappers.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

import '../data_transfer_objects/user_dto.dart';

class UserMapper {
  
  static UserEntity toEntity(UserDTO dto) {

    return UserEntity(
      id: dto.id,
      name: dto.name,
      email: dto.email, 
      role: RoleMapper.toEntity(dto: dto), 
      lastUpdate: dto.lastUpdate,
      fcmToken:dto.fcmToken
    );

  }

  static UserDTO toDTO(UserEntity entity) {
    return UserDTO(
      id: entity.id,
      name: entity.name,
      email: entity.email, 
      role: entity.role.name,
      lastUpdate: entity.lastUpdate, 
      fcmToken: entity.fcmToken,
    );
  }
}
