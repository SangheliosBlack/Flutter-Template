// auth_local_data_source_impl.dart
import 'package:flutter_template/core/constants/local_storage_keys.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_template/features/auth/data/datasources/local/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  
  final LocalStorageServiceImpl localStorageService;

  AuthLocalDataSourceImpl({required this.localStorageService});
  
  @override
  Future<void> saveToken({required String token}) async {

    await localStorageService.setValue(key: LocalStorageKeys.ACCESS_TOKEN, value: token);

  }

}
