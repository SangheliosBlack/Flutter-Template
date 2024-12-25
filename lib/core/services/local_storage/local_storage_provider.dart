import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'local_storage_service_impl.dart';

final localStorageServiceProvider = Provider<LocalStorageServiceImpl>((ref) {

  return LocalStorageServiceImpl();
  
});
