import 'package:flutter_template/core/services/http_client/http_client_service_impl.dart';
import 'package:flutter_template/core/services/local_storage/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final httpClientServiceProvider = Provider<HttpClientServiceImpl>((ref) {

  final localStorageService = ref.read(localStorageServiceProvider);

  return HttpClientServiceImpl(localStorageService: localStorageService, ref: ref);
  
});