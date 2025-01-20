import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {

  @override
  FutureOr<String?> getValue({required String key}) async {

    return await const FlutterSecureStorage().read(
      key: key,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );

  }

  @override
  Future<void> setValue({required String key, required String value}) async {

    await const FlutterSecureStorage().write(
      key: key,
      value: value,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );

  }

  @override
  Future<void> deleteValue({required String key}) async {

    await const FlutterSecureStorage().delete(
      key: key, 
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );

  }
  
  @override
  Future<void> clear() async {

    FlutterSecureStorage().deleteAll();

  }
}

/*
 iOptions:  IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  ), 
*/