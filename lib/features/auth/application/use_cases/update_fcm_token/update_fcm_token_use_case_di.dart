import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/update_fcm_token/update_fcm_token_use_case.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository_di.dart';

final updateFcmTokenUseCaseDi = Provider<UpdateFcmUseCase>((ref){

  final authRepository = ref.read(authRepositoryDi);

  return UpdateFcmUseCase(authRepository: authRepository);

});