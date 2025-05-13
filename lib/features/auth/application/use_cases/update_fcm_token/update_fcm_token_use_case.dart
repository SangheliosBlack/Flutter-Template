import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

class UpdateFcmUseCase {

  final AuthRepository authRepository;

  UpdateFcmUseCase({required this.authRepository});

   Future<DataState<UserEntity>> execute({required String fcmToken }) async {
    
    return  authRepository.updateFcmToken(fcmToken: fcmToken);
    
  }

}