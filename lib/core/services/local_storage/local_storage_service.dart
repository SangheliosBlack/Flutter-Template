import 'dart:async';

abstract interface class LocalStorageService {

  Future<void> deleteValue({required String key});

  FutureOr<String?> getValue({required String key});

  Future<void> setValue({required String key, required String value});

  Future<void> clear();


}
