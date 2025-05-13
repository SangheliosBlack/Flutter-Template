import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/load_user/load_user_use_case.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository_di.dart';

final loadUserCaseProvider = Provider<LoadUserCase>((ref){

  final authRepository = ref.read(authRepositoryDi);

  return LoadUserCase(authRepository: authRepository);

});