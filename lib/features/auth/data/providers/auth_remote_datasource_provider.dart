import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/http_client/http_client_provider.dart';
import 'package:flutter_template/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSourceImpl>((ref) {

  final httpClientService = ref.read(httpClientServiceProvider);

  return AuthRemoteDataSourceImpl(httpClientService: httpClientService);

});