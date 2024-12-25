import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

import '../data_transfer_objects/user_dto.dart';

class UserMapper {
  
  static UserEntity toEntity(UserDTO dto) {

    return UserEntity(
      id: dto.id,
      name: dto.name,
      email: dto.email, 
      lastName: '', 
      role: '', 
      lastUpdate: dto.lastUpdate,
    );

  }

  static UserDTO toDTO(UserEntity entity) {
    return UserDTO(
      id: entity.id,
      name: entity.name,
      email: entity.email, 
      role: '', 
      lastUpdate: entity.lastUpdate,
    );
  }
}
