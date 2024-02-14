import 'package:flutter_template/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/providers/socket_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/repositories/auth_repository.dart';
import 'package:flutter_template/services/http_service.dart';

final sl = GetIt.I;

Future<void> initLocator() async {
  //*BLOCs
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  sl.registerFactory(() => RegisterBloc());
  //*REPOSITORIEs
  sl.registerFactory(() => AuthRepository(httpService: sl()));
  //*SERVICEs
  sl.registerSingleton<HttpService>(HttpService());
  sl.registerSingleton<Developer>(Developer());
  //*PROVIDERS
  sl.registerSingleton<SocketService>(
      SocketService(httpService: sl(), developer: sl()));
}
