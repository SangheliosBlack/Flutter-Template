
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

class LoginUserEntity {

    UserEntity user;
    String accessToken;

    LoginUserEntity({
        required this.user,
        required this.accessToken,
    });

}
