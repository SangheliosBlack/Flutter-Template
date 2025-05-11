import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/load_user/load_user_use_case.dart';
import 'package:flutter_template/features/auth/application/use_cases/load_user/load_user_use_case_di.dart';

class AuthUseCases {

  final Ref ref;

  AuthUseCases({required this.ref});

  LoadUserCase get loadUser => ref.read(loadUserCaseProvider);

}

final useCasesAuth = Provider((ref) => AuthUseCases(ref: ref) );