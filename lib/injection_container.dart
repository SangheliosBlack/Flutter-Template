
import 'package:get_it/get_it.dart';
import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/repositories/auth_repository.dart';
import 'package:skeleton/services/http_service.dart';

final sl = GetIt.I;

Future<void> initLocator() async{
  //*BLOCs
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  //*REPOSITORIEs
  sl.registerFactory(() => AuthRepository(httpService: sl()));
  //*SERVICEs
  sl.registerSingleton<HttpService>(HttpService());
}