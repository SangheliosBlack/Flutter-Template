import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_provider.dart';
import 'package:flutter_template/features/auth/data/datasources/local/auth_local_data_source_impl.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSourceImpl>((ref) {

  final localStorageService = ref.read(localStorageServiceProvider);

  return AuthLocalDataSourceImpl(
    localStorageService:localStorageService
  );

});