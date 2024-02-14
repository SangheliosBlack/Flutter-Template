import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template/models/auth_response.dart';
import 'package:flutter_template/models/general_response.dart';
import 'package:flutter_template/repositories/auth_repository.dart';
import 'package:flutter_template/services/http_service.dart';
import 'package:flutter_template/services/local_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<IsLoggedIn>(_isLoggedIn);
    on<LogoutEvent>(_logOut);
    on<LoginGuest>(_loginGuest);
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

  _loginGuest(LoginGuest event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      await Future.delayed(const Duration(seconds: 3));

      final response = await authRepository.createGuest(
          email: event.email,
          firstName: event.firstName,
          fatherLastName: event.fatherLastName,
          motherLastName: event.motherLastName,
          phone: event.phone,
          password: event.password);

      if (response is ResponseSuccess) {
        emit(AuthSuccess(usuario: response.data));
      } else {
        emit(AuthError(message: response.message));
      }
    } catch (e) {
      emit(const AuthError(message: "Error desconocido"));
    }
  }
}
