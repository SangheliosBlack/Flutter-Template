import 'package:flutter_template/features/auth/data/data_transfer_objects/user_login_response_dto.dart';
import 'package:flutter_template/features/auth/data/mappers/user_mapper_response.dart';
import 'package:flutter_template/features/auth/domain/entities/login_user_response_entiti.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

class LoginUserResponseMapper {

  final UserEntity user;
  final String accessToken;

  LoginUserResponseMapper({
    required this.user,
    required this.accessToken,
  });

  static LoginUserEntity toLoginUserEntity(UserLoginResponseDTO dto) {
    return LoginUserEntity(
      user: UserMapper.toEntity(dto.user),
      accessToken: dto.accessToken,
    );
  }

  UserLoginResponseDTO toUserLoginResponseDTO() {
    return UserLoginResponseDTO(
      user: UserMapper.toDTO(user),
      accessToken: accessToken,
    );
  }
}
