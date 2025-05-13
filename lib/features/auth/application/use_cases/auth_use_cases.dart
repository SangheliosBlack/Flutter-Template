import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/load_user/load_user_use_case.dart';
import 'package:flutter_template/features/auth/application/use_cases/load_user/load_user_use_case_di.dart';
import 'package:flutter_template/features/auth/application/use_cases/update_fcm_token/update_fcm_token_use_case.dart';
import 'package:flutter_template/features/auth/application/use_cases/update_fcm_token/update_fcm_token_use_case_di.dart';

class AuthUseCases {

  final Ref ref;

  AuthUseCases({required this.ref});

  LoadUserCase get loadUser => ref.read(loadUserCaseProvider);
  UpdateFcmUseCase get updateFcm => ref.read(updateFcmTokenUseCaseDi);

}

final useCasesAuth = Provider((ref) => AuthUseCases(ref: ref) );