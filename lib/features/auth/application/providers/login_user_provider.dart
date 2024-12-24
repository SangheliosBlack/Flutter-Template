import 'package:flutter_template/features/auth/data/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/domain.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {

  final authRepository = ref.read(authRepositoryProvider);

  return LoginUseCase(authRepository);
  
});