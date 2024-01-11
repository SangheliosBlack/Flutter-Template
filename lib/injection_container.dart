import 'package:get_it/get_it.dart';
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/repositories/auth_repository.dart';
import 'package:flutter_template/services/http_service.dart';

final sl = GetIt.I;

Future<void> initLocator() async {
  //*BLOCs
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  //*REPOSITORIEs
  sl.registerFactory(() => AuthRepository(httpService: sl()));
  //*SERVICEs
  sl.registerSingleton<HttpService>(HttpService());
}
