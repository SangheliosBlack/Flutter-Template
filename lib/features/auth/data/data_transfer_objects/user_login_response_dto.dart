import 'user_dto.dart';

class UserLoginResponseDTO {

  final UserDTO user;
  final String accessToken;

  UserLoginResponseDTO({
    required this.user,
    required this.accessToken,
  });

  factory UserLoginResponseDTO.fromJson(Map<String, dynamic> map) {

    return UserLoginResponseDTO(
      user: UserDTO.fromJson(map['user']),
      accessToken: map['accessToken'],
    );

  }

  Map<String, dynamic> toMap() {

    return {
      'user': user.toMap(),
      'accessToken': accessToken,
    };

  }

}