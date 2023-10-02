import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeleton/models/auth_response.dart';
import 'package:skeleton/repositories/auth_repository.dart';
import 'package:skeleton/services/http_service.dart';
import 'package:skeleton/services/local_storage.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<IsLoggedIn>(_isLoggedIn);
    on<LogoutEvent>(_logOut);
  }

  _logOut(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial());

    HttpService().eliminarToken();
  }

  _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    final result = await authRepository.login(
        userName: event.username, password: event.password);

    if (result is AuthRSuccess) {
      emit(AuthSuccess(usuario: result.usuario!));
    } else {
      emit(AuthError(message: result.message));
    }
  }

  _isLoggedIn(IsLoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final token = LocalStorage.prefs.getString('token');

    await Future.delayed(const Duration(seconds: 3));

    if (token != null) {
      final result = await authRepository.isLoggedIn();

      if (result is AuthRSuccess) {
        emit(AuthSuccess(
          usuario: result.usuario!,
        ));
      } else {
        emit(const AuthError(message: "Tu token ha caducado"));
      }
    } else {
      emit(const AuthError(message: ""));
    }
  }
}
