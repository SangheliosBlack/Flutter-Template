
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

import 'providers.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {

  final authRemoteDataSourceService = ref.read(authRemoteDataSourceProvider); 
  final authLocalDataSourceService = ref.read(authLocalDataSourceProvider);

  return AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSourceService, 
    localDataSource: authLocalDataSourceService
  );
  
});
